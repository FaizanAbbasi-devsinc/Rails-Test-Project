# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :set_user, only: %i[show edit update]

  def index
    @users = User.order(:id)
  end

  def show; end

  def edit; end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to current_user, notice: 'You Successfully updated your Profile' }
      else
        @user.errors.full_messages
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
