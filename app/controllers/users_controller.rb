
class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :set_user, only: [:show, :edit, :update]

  def set_user
    @user = User.find(params[:id])
  end


  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
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
