class KitsController < ApplicationController
  before_action :set_kit, only: [ :show, :edit, :update, :destroy ]
  skip_before_action :authenticate_user!, only: [ :show ]

  def index
    # @kits = Kit.where(user_id: current_user.id)
    @user = current_user
    @kits = policy_scope(Kit).order(created_at: :desc)
  end

  def show
    @steps = Step.where(kit_id: @kit)
    @kit_url = "#{request.base_url}/kits/#{@kit.id}"
  end

  def new
    @kit = Kit.new
    authorize @kit
  end

  def create
    @kit = Kit.new(kit_params)
    @kit.user = current_user
    authorize @kit
    if @kit.save
      redirect_to new_kit_step_path(@kit)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @kit.update(kit_params)
      redirect_to kit_path(@kit)
    else
      render :edit
    end
  end

  def destroy
    @kit.destroy
    redirect_to root_path
  end

  private

  def set_kit
    @kit = Kit.find(params[:id])
    authorize @kit
  end

  # TODO: to add image to strong params
  def kit_params
    params.require(:kit).permit(:title, :description, :photo)
  end

  def sharekit
    UserMailer.welcome(user_email).deliver_now
  end

end
