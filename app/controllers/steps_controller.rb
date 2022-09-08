class StepsController < ApplicationController
  def new
    @step = Step.new
    @kit = Kit.find(params[:kit_id])
  end

  def create
    @kit = Kit.find(params[:kit_id])
    @step = Step.new(step_params)
    @step.kit = @kit
    if @step.save
      redirect_to kit_path(@kit)
    else
      render :new
    end
  end

  def show
    @step = Step.find(params[:id])
  end

  private

  # TODO: add image to strong params
  def step_params
    params.require(:step).permit(:content)
  end
end
