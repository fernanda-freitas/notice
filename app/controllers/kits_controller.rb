class KitsController < ApplicationController
  def index
    @kits = Kit.all
  end

  def show
    @kit = Kit.find(params[:id])
  end

end
