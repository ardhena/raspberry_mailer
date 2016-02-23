require 'test_helper'
require_relative '../../app/mailers/time_table'

require 'date'
require_relative '../../config/initializers/string'

APP_PATH = 'test'

module Mailer
  class TimeTableTest < Minitest::Test
    def setup
      @date = Date.parse('2016-01-09')
      @fetcher = TimeTable.new(@date)
    end

    def test_initialize
      assert_equal Date.parse('2016-01-12'), @fetcher.saturday
      assert_equal Date.parse('2016-01-13'), @fetcher.sunday
      assert_equal 'test/app/templates/time_table.html.erb', @fetcher.template_path
    end
  end
end
