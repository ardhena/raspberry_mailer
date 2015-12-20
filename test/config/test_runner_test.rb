require 'test_helper'
require_relative '../../config/test_runner'

class TestRunnerTest < Minitest::Test
  def setup
    @path = "#{Dir.pwd}/test/fixtures/test"
    @files = [ "#{@path}/app/some_test.rb", "#{@path}/config_test.rb" ]
    @runner = Config::TestRunner.new(@path)
  end

  def test_setting_path
    assert_equal @path, @runner.path
  end

  def test_fetching_files
    assert_equal @files, @runner.files
  end
end
