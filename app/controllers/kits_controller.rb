class KitsController < ApplicationController
  def index
    @kits = Kit.all
  end

  def show
    @kit = Kit.find(params[:id])
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
    @kit = Kit.find(params[:id])
  end

  def update
    @kit = Kit.find(params[:id])
    if @kit.update(kit_params)
      redirect_to kit_path(@kit)
    else
      render :edit
    end
  end

  private

  def kit_params
    params.require(:kit).permit(:title, :description)
  end

  # TODO to add image to stropng params

end
