class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @boats = current_user.boats
  end
end
