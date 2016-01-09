module Runner
  class Main
    attr_reader :date, :day_of_week

    def initialize(date)
      @date = date
      @day_of_week = date.wday
    end

    def call
      puts 'Nothing to do here (yet)'
      # execute schedulers for today
    end
  end
end
