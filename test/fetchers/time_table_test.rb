require 'test_helper'
require_relative '../../app/fetchers/time_table'

require 'date'

module Fetcher
  class TimeTableTest < Minitest::Test
    def setup
      @date = Date.parse('2016-01-09')
      @fetcher = TimeTable.new(@date)
    end

    def test_initialize
      assert_equal '2016-01-09', @fetcher.day.to_s
    end
  end
end
