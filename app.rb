PATH = Dir.pwd
require "#{PATH}/config/file_loader.rb"
Config::FileLoader.new(PATH).call
