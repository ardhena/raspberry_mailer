module Formatter
  class TimeTable
    LECTURE = '1WA'
    EXERCISES = '1CC'

    attr_reader :day, :data

    Lesson = Struct.new(:from, :to, :code, :subject, :type, :classroom, :teacher)

    def initialize(day)
      @day = day
      @data = Fetcher::TimeTable.new(day).call
    end

    def call
      filter_data.map do |lesson|
        create(lesson)
      end
    end

    private

    def filter_data
      data.select{ |lesson| lesson[4].include?(LECTURE) || lesson[4].include?(EXERCISES) }
    end

    def create(lesson)
      Lesson.new(
        lesson[1].gsub('.', ':'),
        lesson[7].gsub('.', ':'),
        code(lesson[4]),
        subject(lesson[4]),
        type(lesson[4]),
        [lesson[2], lesson[3]].reject(&:empty?).join(', '),
        lesson[5]
      )
    end

    def code(text)
      text.split(' ').first
    end

    def subject(text)
      text.split(' - ').last
    end

    def type(text)
      return 'wykład' if text.include?(LECTURE)
      return 'ćwiczenia' if text.include?(EXERCISES)
    end
  end
end
