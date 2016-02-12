require 'test_helper'
require_relative '../../runners/main'

module Mailer
  class TimeTable;
  end
end

class MainTest < Minitest::Test
  def setup
    @date = Date.parse('2016-01-09')
    @runner = Runner::Main.new(@date)
  end

  def test_set_today_date
    assert_equal @date, @runner.date
    assert_equal 6, @runner.day_of_week
  end

  def test_run_schedulers
    assert_equal Mailer::TimeTable, @runner.call.class
  end
end
