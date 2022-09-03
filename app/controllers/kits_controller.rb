class KitsController < ApplicationController
  before_action :set_kit, only: [ :show, :edit, :update, :destroy ]

  def index
    @kits = Kit.all
  end

  def show
  end

  def new
    @kit = Kit.new
  end

  def create
    @kit = Kit.new(kit_params)
    @kit.user = current_user
    if @kit.save!
      redirect_to kit_path(@kit)
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
  end

  # TODO: to add image to stropng params
  def kit_params
    params.require(:kit).permit(:title, :description)
  end
end
