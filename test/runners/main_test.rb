require 'test_helper'
require_relative '../../runners/main'

require 'date'

module Mailer
  class TimeTable;
    def initialize(_); end;
  end
end

module Runner
  class MainTest < Minitest::Test
    def setup
      @date = Date.parse('2016-02-17')
      @runner = Main.new(@date)
    end

    def test_set_today_date
      assert_equal @date, @runner.date
      assert_equal 3, @runner.day_of_week
    end

    def test_run_time_table
      assert_equal Mailer::TimeTable, @runner.call.class
    end
  end
end
