class StepsController < ApplicationController
  before_action :set_kit, only: [ :new, :create, :show, :destroy ]
  before_action :set_step, only: [ :show, :edit, :update, :add_media, :save_media, :destroy ]

  # def new
  #   @step = Step.new
  #   authorize @step
  # end

  def create
    @step = Step.new(step_params)
    @step.kit = @kit
    authorize @step
    if @step.save
      redirect_to new_step_task_path(@step)
    else
      render :new
    end
  end

  def show
    # Before action
    @tasks = Task.where(:step_id => @step)
    @steps = Step.where(kit_id: @kit)
    @step = Step.find(params[:id])
    authorize @step
  end

  def edit
    # Before action
  end

  def update
    # Before action
    @kit = @step.kit
    if @step.update(step_params)
      redirect_to kit_path(@kit)
    else
      render :edit
    end
  end

  def add_media
    # Before action
    # Retrieving the number of the step to display it in the view
    @kit = Kit.find(@step.kit_id)
    @step_number = @kit.steps.count
  end

  def save_media
    # Before action
    if params[:step].nil? || @step.update(step_params)
      redirect_to new_step_task_path(@step)
    else
      render :add_media
    end
  end

  def destroy
    @step.destroy
    redirect_to kit_path(@kit)
    authorize @step
  end

  private

  def set_kit
    @kit = Kit.find(params[:kit_id])
  end

  def set_step
    @step = Step.find(params[:id])
    authorize @step
  end

  def step_params
    params.require(:step).permit(:title, :content, :photo)
  end
end
