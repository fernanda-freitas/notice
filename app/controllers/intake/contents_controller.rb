module Intake
  class ContentsController < ApplicationController
    def new
      @kit = Kit.find(params[:kit_id])
      @content = Content.new
      authorize @kit

      # Retrieving the number of the step to display it in the view
      if @kit.steps
        @step_number = @kit.steps.count + 1
      else
        @step_number = 1
      end
    end

    def create
      @kit = Kit.find(params[:kit_id])
      @content = Content.new(content_params)
      authorize @kit

      if @content.valid?

        # The values from the previous form step need to be
        # retrieved from the session store.
        full_params = content_params.merge(
          title: session['title']['title'],
          kit_id: params[:kit_id]
        )

        # Here we finally carry out the ultimate objective:
        # creating a User record in the database.
        @step = Step.new(full_params)
        @step.save!

        # Upon successful completion of the form we need to
        # clean up the session.
        session.delete('title')

        redirect_to add_media_step_path(@step)
      else
        render :new
      end
    end

    private

    def content_params
      params.require(:intake_content).permit(
        :content
      )
    end
  end
end
