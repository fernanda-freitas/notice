class TasksController < ApplicationController

  def new
    @step = Step.find(params[:step_id])
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @step = Step.find(params[:step_id])
    @kit = @step.kit_id
    @task.step = @step
    if @task.save
      redirect_to kit_step_path(@kit, @step)
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:content)
  end

end
