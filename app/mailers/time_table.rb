module Mailer
  class TimeTable
    attr_reader :saturday, :sunday, :template_path, :fetcher

    TEMPLATE_NAME = 'time_table'

    def initialize(date)
      @saturday = date.next.next.next
      @sunday = saturday.next
      @template_path = "#{::PATH}/app/templates/#{TEMPLATE_NAME}.html.erb"
    end

    def call
      fetch_data
      MailSender.new(@subject, @template).call
    end

    private

    def fetch_data
      @saturday_classes = Formatter::TimeTable.new(saturday).call
      @sunday_classes = Formatter::TimeTable.new(sunday).call
      @template = ERB.new(File.read(template_path)).result(binding)
      @subject = "Plan zajęć UAM - #{saturday.strftime('%d.%m.%Y')}, #{sunday.strftime('%d.%m.%Y')}"
    end
  end
end
