class StepsController < ApplicationController
  before_action :set_kit, only: [ :new, :create ]
  before_action :set_step, only: [ :show, :edit, :update ]

  def new
    @step = Step.new
  end

  def create
    @step = Step.new(step_params)
    @step.kit = @kit
    if @step.save
      redirect_to kit_path(@kit)
    else
      render :new
    end
  end

  def show
    # Before action
  end

  def edit
    # Before action
  end

  def update
    if @step.update(step_params)
      redirect_to step_path(@step)
    else
      render :edit
    end
  end

  def destroy
    @step = Step.find(params[:id])
    @step.destroy
    redirect_to root_path
  end

  private

  def set_kit
    @kit = Kit.find(params[:kit_id])
  end

  def set_step
    @step = Step.find(params[:id])
  end

  # TODO: add image to strong params
  def step_params
    params.require(:step).permit(:title, :content)
  end
end
