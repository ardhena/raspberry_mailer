# require 'mail'

# class Mailer
#   SENDER = 'olgadraber@gmail.com'
#   RECEIVERS = 'olgadraber@gmail.com'

#   attr_reader :subject, :file_name

#   def initialize(subject, file_name)
#     @subject = subject
#     @file_name = file_name
#   end

#   def deliver
#       name = file_name
#       mail = Mail.new do
#       from 	  SENDER
#       to	    RECEIVERS
#       subject 'Last.fm log'
#       html_part do
#         content_type  'text/html; charset=UTF-8'
#         body          File.read(name)
#       end
#     end
#     mail.deliver
#   end
# end

