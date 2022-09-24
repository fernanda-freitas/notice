class TasksController < ApplicationController

  def new
    @step = Step.find(params[:step_id])
    @task = Task.new
    authorize @task

    # Retrieving the number of the step to display it in the view
    @kit = Kit.find(@step.kit_id)
    @step_number = @kit.steps.count
  end

  def create
    @task = Task.new(task_params)
    @step = Step.find(params[:step_id])
    @kit = @step.kit_id
    @task.step = @step
    authorize @task
    if @task.save
      redirect_to kit_step_path(@kit, @step)
    else
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @step = Step.find(params[:step_id])
    @kit = @step.kit_id
    @task.destroy
    authorize @task
    redirect_to kit_step_path(@kit, @step)
  end

  private

  def task_params
    params.require(:task).permit(:content)
  end

end
