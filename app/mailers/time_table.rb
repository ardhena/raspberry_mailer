module Mailer
  class TimeTable
    attr_reader :template_name

    def initialize
      @template_name = self.class.name.split('::').last.snake_case
    end
  end
end
