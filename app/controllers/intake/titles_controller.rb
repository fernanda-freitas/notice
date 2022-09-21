module Intake
  class TitlesController < ApplicationController
    def new
      # An instance of Title is created just the
      # same as you would for any Active Record object.
      @kit = Kit.find(params[:kit_id])
      @title = Title.new
    end

    def create
      # Again, an instance of UserProfile is created
      # just the same as you would for any Active
      # Record object.
      @kit = Kit.find(params[:kit_id])
      @title = Title.new(title_params)

      # The valid? method is also called just the same
      # as for any Active Record object.
      if @title.valid?

        # Instead of persisting the values to the
        # database, we're temporarily storing the
        # values in the session.
        session[:title] = {
          'title' => @title.title,
        }

        redirect_to new_kit_intake_content_path(@kit)
      else
        render :new
      end
    end

    private

    # The strong params work exactly as they would
    # for an Active Record object.
    def title_params
      params.require(:intake_title).permit(
        :title
      )
    end
  end
end
