class KitsController < ApplicationController
  def index
    @kits = Kit.all
  end
end
