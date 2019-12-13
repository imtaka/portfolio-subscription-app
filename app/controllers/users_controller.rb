class UsersController < ApplicationController
  def detail
    @user = User.find_by(id: params[:id])
  end
end
