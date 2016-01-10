# TODO
# - allow to run single files or by regex
# - test quick and all running options
# - similar file? and directory? methods as in file_loader - DRY it

module Config
  class TestRunner
    FILE_NAME_PATTERN = 'test.rb'
    EXCLUDE_DIRS = [ '.', '..', 'fixtures' ]

    attr_reader :path, :options

    def initialize(path, options)
      @path = path
      @options = options
    end

    def files
      fetch_files(path).reject(&:nil?).sort
    end

    def call
      files.shuffle.each do |file|
        options.quick ? quick(file) : all(file)
      end
    end

    private

    def quick(file)
      system "echo 'Running \e[35m#{file}\e[0m'"
      system "ruby -Ilib:test #{file} | grep assertions"
    end

    def all(file)
      system "echo 'Running \e[35m#{file}\e[0m'"
      system "ruby -Ilib:test #{file}"
      system "echo"
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
      File.file?(file_name) && file_name.include?(FILE_NAME_PATTERN)
    end
  end
end
