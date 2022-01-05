
class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
     @user = User.find(params[:id])
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to current_user, notice: 'You Successfully updated your Profile' }
      else
        format.html { render :edit , status: :unprocessable_entity}
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
