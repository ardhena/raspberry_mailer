APP_ENV = ENV['RASPBERRY_MAILER_ENV'] || 'development'
APP_PATH = ENV['RASPBERRY_MAILER_PATH'] || Dir.pwd

require "#{APP_PATH}/config/file_loader.rb"
Config::FileLoader.new(APP_PATH).call

date = Date.parse('2016-03-09')
# date = Date.today
Runner::Main.new(date).call
