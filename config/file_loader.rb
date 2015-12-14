module Config
  class FileLoader
    LOADED_FILES = [ 'app.rb', 'file_loader.rb']
    EXCLUDED_DIRS = [ '.', '..', '.git']
    EXCLUDED_FILES = [ 'log', LOADED_FILES ].flatten

    attr_reader :path

    def initialize(path)
      @path = path
    end

    def load
      generate_files(path).reject(&:nil?).sort
    end

    private

    def generate_files(path)
      Dir.entries(path).flat_map do |entry|
        if directory?(path, entry)
          generate_files(file_with_path(path, entry))
        elsif file?(path, entry)
          add_entry(path, entry)
        end
      end
    end

    def directory?(path, entry)
      File.directory?(file_with_path(path, entry)) && !EXCLUDED_DIRS.include?(entry)
    end

    def file?(path, entry)
      File.file?(file_with_path(path, entry)) && !EXCLUDED_FILES.include?(entry)
    end

    def add_entry(path, entry)
      return file_with_path(path, entry) unless entry.include?('Gemfile')
      generate_gems(path, entry) if entry == 'Gemfile'
    end

    def generate_gems(path, entry)
      gems = []
      File.foreach(file_with_path(path, entry)) do |line|
        if line.include?('gem') && !line.include?('source')
          gems << gem_name(line)
        end
      end
      gems
    end

    def gem_name(line)
      line.split("'").reject{ |line| line == 'gem ' }.first
    end

    def file_with_path(path, file)
      "#{path}/#{file}"
    end
  end
end
