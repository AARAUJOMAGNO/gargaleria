class UsersController < ApplicationController
  before_action :set_user

  def become_seller
  end

  def update
    @user.seller = true
    @user.update(user_params)

    redirect_to root_path
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:address, :company, :first_name, :last_name, :seller, :photo)
  end
end
