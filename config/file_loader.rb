# TODO
# - move gem and file list creation to separate files
# - make loaded dirs somehow configurable (for example via array to allow executing bin with options)
#   (will this even be used for something?)

module Config
  class FileLoader
    LOAD_DIRS = %w(app config/initializers runners)
    LOAD_FILE_EXTENSTIONS = %w(.rb)
    EXCLUDE_DIRS = %w(. ..)

    attr_reader :path

    def initialize(path)
      @path = path
    end

    def call
      (files + gems + modules).each do |file|
        require file
      end
    end

    def files
      all_files = []
      LOAD_DIRS.each do |dir|
        dir_path = "#{path}/#{dir}"
        all_files << fetch_files(dir_path) if File.exists?(dir_path)
      end
      all_files.flatten.reject(&:nil?).sort
    end

    def gems
      fetch_gems
    end

    def modules
      %w(date erb)
    end

    private

    def fetch_gems
      gems = []
      File.foreach("#{path}/Gemfile") do |line|
        if line.include?('gem') && !line.include?('source') && !line.include?('#skip')
          gems << gem_name(line)
        end
      end
      gems
    end

    def fetch_files(sub_path)
      Dir.entries(sub_path).flat_map do |entry|
        file = "#{sub_path}/#{entry}"
        if directory?(file, entry)
          fetch_files(file)
        elsif file?(file)
          file
        end
      end
    end

    def directory?(file_name, entry)
      File.directory?(file_name) && !EXCLUDE_DIRS.include?(entry)
    end

    def file?(file_name)
      File.file?(file_name) && LOAD_FILE_EXTENSTIONS.include?(File.extname(file_name))
    end

    def gem_name(line)
      array = line.split("'").map(&:strip)
      return array.reject{ |line| line == 'gem' }.first if !array.include?('#')
      array[array.find_index('#').next]
    end
  end
end
