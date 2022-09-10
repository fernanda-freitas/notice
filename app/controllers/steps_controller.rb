class StepsController < ApplicationController
  before_action :set_kit, only: [ :new, :create, :show, :destroy ]
  before_action :set_step, only: [ :show, :edit, :update, :destroy ]

  def index
    @steps = Step.all
    @kit = Kit.find(params[:kit_id])
    @share_url = "#{request.base_url}/kits/#{@kit.id}"
  end

  def new
    @kit = Kit.find(params[:kit_id])
    @step = Step.new
  end

  def create
    @step = Step.new(step_params)
    @step.kit = @kit
    if @step.save
      redirect_to kit_step_path(@kit, @step)
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

  # TODO: add image to strong params
  def step_params
    params.require(:step).permit(:title, :content)
  end
end
