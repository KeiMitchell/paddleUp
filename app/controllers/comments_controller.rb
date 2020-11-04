class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/boats/#{comment.boat.id}" #redirect to boat詳細画面
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, boat_id: params[:boat_id]) #ストロングパラメーターの設定
  end
end
