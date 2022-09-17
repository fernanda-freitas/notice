module Intake
  class ContentsController < ApplicationController
    def new
      @content = Content.new
    end

    def create
      @content = Content.new(content_params)

      if @content.valid?

        # The values from the previous form step need to be
        # retrieved from the session store.
        full_params = content_params.merge(
          title: session['title']['title']
        )

        # Here we finally carry out the ultimate objective:
        # creating a User record in the database.
        Step.create!(full_params)

        # Upon successful completion of the form we need to
        # clean up the session.
        session.delete('title')

        redirect_to kits_path
      else
        render :new
      end
    end

    private

    def user_account_params
      params.require(:intake_content).permit(
        :content
      )
    end
  end
end
