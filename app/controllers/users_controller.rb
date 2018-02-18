class UsersController < ApplicationController
  def index

  end

  def show

    @user = User.find(params[:id])
    binding.pry

  end

end
