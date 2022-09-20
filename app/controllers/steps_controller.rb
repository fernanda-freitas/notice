class StepsController < ApplicationController
  before_action :set_kit, only: [ :new, :create, :show, :destroy ]
  before_action :set_step, only: [ :show, :edit, :update, :add_media, :destroy ]

  def new
    @step = Step.new
  end

  def create
    @step = Step.new(step_params)
    @step.kit = @kit
    if @step.save
      redirect_to new_step_task_path(@step)
    else
      render :new
    end
  end

  def show
    # Before action
    @tasks = Task.where(:step_id => @step)
  end

  def edit
    # Before action
  end

  def update
    # Before action
    if @step.update(step_params)
      redirect_to new_step_task_path(@step)
    else
      render :edit
    end
  end

  def add_media
    # Before action
  end

  # def save_media
  #   # Before action
  #   if @step.update(step_params)
  #     redirect_to new_step_task_path(@step)
  #   else
  #     render :add_media
  #   end
  # end

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
