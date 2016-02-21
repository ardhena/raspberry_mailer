class MailSender
  SENDER = 'olgadraber@gmail.com'
  RECEIVERS = 'olgadraber@gmail.com'

  def initialize(subject, template)
    @subject = subject
    @template = template
  end

  def call
    mail = generate_mail(@subject, @template)
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
end