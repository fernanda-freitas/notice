class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def sharekit
    email = params[:email]
    @link = params[:link]
    # company_name = current_user.company_name
    mail(to: email, subject: "Welcome!")
  end
end
