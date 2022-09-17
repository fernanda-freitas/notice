class Step::MultistepController < ApplicationController
  include Wicked::Wizard
  steps *Step.form_steps

  def show
    @kit = Kit.find(params[:kit_id])
    @step = Step.find(params[:step_id])
    render_wizard
  end

  def update
  end
end
