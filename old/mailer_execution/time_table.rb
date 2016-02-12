module MailerExecution
  class TimeTable < Base
    def initialize(date)
      super(fetch_subject(date), fetch_template_name)
    end

    private

    def generate_template
      @some_variable = 'TESTING if it works'
      super
    end

    def fetch_subject(date)
      "Plan zajęć na dzień #{date}"
    end
  end
end
