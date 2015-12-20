module Config
  class TestRunner
    FILE_NAME_PATTERN = 'test.rb'
    EXCLUDE_DIRS = [ '.', '..', 'fixtures' ]

    attr_reader :path

    def initialize(path)
      @path = path
    end

    def files
      fetch_files(path).reject(&:nil?).sort
    end

    def call
      files.shuffle.each do |file|
        system "echo 'Running \e[35m#{file}\e[0m'"
        system "ruby -Ilib:test #{file}"
        system "echo"
      end
    end

    private

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
