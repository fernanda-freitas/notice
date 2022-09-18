class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def sharekit(user_email)
    @company_name = company_name
    @user_email = params[:email] # Instance variable => available in view
    mail(to: @user_email.email, subject: "Welcome to #{ @company_name} ")
    # This will render a view in `app/views/user_mailer`!
  end
end


# TODO params not fixed
