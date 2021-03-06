# TODO
# - call mailers by meta and select those to be run today
# - mailer classes that would have definition of date and special options
# - mailer execution classes that would actually generate and send the mailer
# - logs

module Runner
  class Main
    attr_reader :date, :day_of_week

    def initialize(date)
      @date = date
      @day_of_week = date.wday
    end

    def call
      if day_of_week == 3
        Mailer::TimeTable.new(date).call
      end
    end
  end
end
