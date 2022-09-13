class StepsController < ApplicationController
  before_action :set_kit, only: [ :show, :destroy ]
  before_action :set_step, only: [ :show, :edit, :update, :destroy ]

  def new
    @step = Step.new
  end

  def create
    @step = Step.new
    @step.kit = @kit
    @step.save(validate: false)
    redirect_to step_multistep_path(@step, Step.steps.first)
  end

  def show
    # Before action
    @tasks = Task.where(:step_id => @step)
  end

  def edit
    # Before action
  end

  def update
    @kit = @step.kit_id
    if @step.update(step_params)
      redirect_to kit_path(@kit)
    else
      render :edit
    end
  end

  def destroy
    @step.destroy
    redirect_to kit_path(@kit)
  end

  private

  def set_kit
    @kit = Kit.find(params[:kit_id])
  end

  def set_step
    @step = Step.find(params[:id])
  end

  def step_params
    params.require(:step).permit(:title, :content, :photo)
  end
end
