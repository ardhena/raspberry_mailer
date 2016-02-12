module MailerExecution
  class Base
    SENDER = 'olgadraber@gmail.com'
    RECEIVERS = 'olgadraber@gmail.com'

    attr_reader :subject, :template_name

    def initialize(subject, template_name)
      @subject = subject
      @template_name = template_name
    end

    def deliver
      mail = generate_mail(subject, generate_template)
      mail.delivery_method :sendmail
      mail.deliver
    end

    private

    def generate_mail(subject, template)
      Mail.new do
        from    SENDER
        to      RECEIVERS
        subject subject
        html_part do
          content_type  'text/html; charset=UTF-8'
          body          template
        end
      end
    end

    def generate_template
      ERB.new(File.read(path_to_template)).result(binding)
    end

    def path_to_template
      "#{PATH}/app/templates/#{template_name}.html.erb"
    end

    def fetch_template_name
      self.class.name.split('::').last.snake_case
    end
  end
end
