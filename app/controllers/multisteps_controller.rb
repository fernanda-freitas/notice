class Step::MultistepsController < ApplicationController
  include Wicked::Wizard
  steps :title, :content, :media

  def show
    @step = Step.find(params[:step_id])
    render_wizard
  end

  def update
  end
end
