module Config
  class FileLoader
    LOAD_DIR = 'app'
    LOAD_FILE_EXTENSTIONS = [ '.rb' ]
    EXCLUDE_DIRS = [ '.', '..' ]

    attr_reader :path

    def initialize(path)
      @path = path
    end

    def gems
      fetch_gems
    end

    def files
      fetch_files("#{path}/#{LOAD_DIR}").reject(&:nil?).sort
    end

    def call
      (files + gems).each do |file|
        require file
      end
    end

    private

    def fetch_gems
      gems = []
      File.foreach("#{path}/Gemfile") do |line|
        if line.include?('gem') && !line.include?('source')
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
      line.split("'").reject{ |line| line == 'gem ' }.first
    end
  end
end
