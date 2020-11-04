class BoatsController < ApplicationController
  before_action :set_boat, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @boats = Boat.includes(:user).order("created_at DESC")
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
    @comment = Comment.new #新規コメント投稿
    @comments = @boat.comments.includes(:user) #アソシエーションにより@boatsに関連する全てのcommnetsを取得 includes(:user)によりN+1問題を解消している
  end

  def search
    @boats = Boat.search(params[:keyword]) #引数にparams[:keyword]と引数を設定することで検索結果を渡している
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
