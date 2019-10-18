class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.to_webmaster.subject
  #
  def to_webmaster(post)
    
    @post = post
    
    mail to: "s3661033@student.rmit.edu.au", suject: "To webmaster"
    # mail to: "s3579811@student.rmit.edu.au", suject: "To webmaster"
  end
end
