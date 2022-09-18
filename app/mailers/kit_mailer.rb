class KitMailer < ApplicationMailer
  def create_confirmation
    @kit = params[:kit]
    mail(
      to:       @kit.user.email,
      subject:  "Restaurant #{@restaurant.name} created!"
    )
  end
end
