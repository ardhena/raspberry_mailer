require 'test_helper'
require_relative '../../app/formatters/time_table'

require 'date'

module Fetcher
  class TimeTable
    def initialize(_); end;
    def call
      [
        ['2016-03-12', '08.15', 'aula A', '', 'ZANILI1 1WA - Analiza matematyczna dla informatyków 1', 'Kąkol Jerzy', '3', '10.30'],
        ['2016-03-12', '10.45', 'aula A', '', 'ZMADLI0 1WA - Matematyka dyskretna', 'Jaworski Jerzy', '3', '13.00'],
        ['2016-03-12', '14.00', 'A2-14', '', 'ZMADLI0 1CA - Matematyka dyskretna', 'Jaworski Jerzy', '3', '16.15'],
        ['2016-03-12', '14.00', 'A2-19', '', 'ZJANLI1 1CB - Język angielski 1', 'Szczepaniak Maria', '3', '16.15'],
        ['2016-03-12', '14.00', 'A0-01', '', 'ZNIFLI1 1CC - Narzędzia informatyki', 'Piłka Tomasz', '3', '16.15'],
        ['2016-03-12', '16.30', 'A2-19', '', 'ZJANLI1 1CA - Język angielski 1', 'Szczepaniak Maria', '3', '18.45']
      ]
    end
  end
end

module Formatter
  class TimeTableTest < Minitest::Test
    def setup
      @date = Date.parse('2016-01-09')
      @formatter = TimeTable.new(@date)
      @data = @formatter.data
      @result_data = @formatter.call
    end

    def test_initialize
      assert_equal '2016-01-09', @formatter.day.to_s
      assert_equal @data, @formatter.data
    end

    def test_create_collection
      assert_equal 3, @result_data.count
      assert_equal Formatter::TimeTable::Lesson, @result_data.first.class
    end

    def test_create_lecture
      lecture = @result_data.first
      assert_equal '08:15', lecture.from
      assert_equal '10:30', lecture.to
      assert_equal 'ZANILI1', lecture.code
      assert_equal 'Analiza matematyczna dla informatyków 1', lecture.subject
      assert_equal 'wykład', lecture.type
      assert_equal 'aula A', lecture.classroom
      assert_equal 'Kąkol Jerzy', lecture.teacher
    end

    def test_create_exercises
      exercises = @result_data.last
      assert_equal '14:00', exercises.from
      assert_equal '16:15', exercises.to
      assert_equal 'ZNIFLI1', exercises.code
      assert_equal 'Narzędzia informatyki', exercises.subject
      assert_equal 'ćwiczenia', exercises.type
      assert_equal 'A0-01', exercises.classroom
      assert_equal 'Piłka Tomasz', exercises.teacher
    end
  end
end




