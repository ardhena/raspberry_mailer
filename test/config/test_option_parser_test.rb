require 'test_helper'
require_relative '../../config/test_option_parser'

class TestOptionParserTest < Minitest::Test
  def test_quick_present
    assert_equal true, Config::TestOptionParser.new(['-q', '-h']).quick
  end

  def test_quick_missing
    assert_equal false, Config::TestOptionParser.new(['-h']).quick
  end
end
