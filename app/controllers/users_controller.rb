class UsersController < ApplicationController

 before_action :authenticate_user!

  def index

  end

  def show

    @user = User.find(params[:id])

  end

  def destroy

    user = User.find(params[:id])
    if user.user_id == current_user.id
      user.destroy
      redirect_to '/index'
    end
    
  end

end
