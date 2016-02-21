require 'test_helper'
require_relative '../../config/file_loader'

class FileLoaderTest < Minitest::Test
  def setup
    @path = "#{Dir.pwd}/test/fixtures"
    @files = ["#{@path}/app/bar/file_2.rb", "#{@path}/app/file_1.rb"]
    @gems = %w(pry pry pry)
    @modules = %w(date erb)
    @loader = Config::FileLoader.new(@path)
  end

  def test_setting_path
    assert_equal @path, @loader.path
  end

  def test_fetching_files
    assert_equal @files, @loader.files
  end

  def test_fetching_gems
    assert_equal @gems, @loader.gems
  end

  def test_fetching_modules
    assert_equal @modules, @loader.modules
  end

  def test_loading
    assert @loader.call
  end
end
