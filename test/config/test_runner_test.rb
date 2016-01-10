require 'test_helper'
require_relative '../../config/test_runner'

class TestRunnerTest < Minitest::Test
  Option = Struct.new(:quick)
  def setup
    @path = "#{Dir.pwd}/test/fixtures/test"
    @files = [ "#{@path}/app/some_test.rb", "#{@path}/config_test.rb" ]
    @options = Option.new(true)
    @runner = Config::TestRunner.new(@path, @options)
  end

  def test_setting_path
    assert_equal @path, @runner.path
  end

  def test_fetching_files
    assert_equal @files, @runner.files
  end

  def test_call
    skip
    @runner.call
    # test properly called methods or move console output to another class and stub it
  end
end
