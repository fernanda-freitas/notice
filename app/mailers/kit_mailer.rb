class KitMailer < ApplicationMailer
  def sharekit
    @kit = params[:kit]
    mail(
      to:       @kit.user.email,
      subject:  "Welcome!"
    )
  end
end
