PATH = Dir.pwd
require "#{PATH}/config/file_loader.rb"

Config::FileLoader.new(PATH).load.each do |file|
  require file
end
