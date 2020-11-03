class BoatsController < ApplicationController
  before_action :set_boat, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @boats = Boat.all
  end

  def new
    @boat = Boat.new
  end

  def create
    Boat.create(boat_params)
  end

  def destroy
    boat = Boat.find(params[:id])
    boat.destroy
  end

  def edit
  end

  def update
    boat = Boat.find(params[:id])
    boat.update(boat_params)
  end

  def show
  end

  private
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
  def set_boat
    @boat = Boat.find(params[:id])
  end

  def boat_params
    params.require(:boat).permit(:image, :description, :brand_id, :size_id).merge(user_id: current_user.id)
  end
end
