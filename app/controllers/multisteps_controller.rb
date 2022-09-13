class Step::MultistepsController
  include Wicked::Wizard
  steps *Step.form_multisteps

  def show
    @step = Step.find(params[:step_id])
    render_wizard
  end

  def update
  end
end
