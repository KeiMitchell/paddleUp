class BoatsController < ApplicationController
  def index
    @boats = Boat.all
  end

  def new
    @boat = Boat.new
  end

  def create
    Boat.create(boat_params)
  end

  private
  def boat_params
    params.require(:boat).permit(:image, :description, :brand_id, :size_id)
  end
end
