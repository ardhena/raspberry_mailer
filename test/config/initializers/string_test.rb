require 'test_helper'
require_relative '../../../config/initializers/string'

class StringTest < Minitest::Test
  def test_snake_case
    assert_equal 'i_am_in_snake_case', 'IAmInSnakeCase'.snake_case
  end
end
