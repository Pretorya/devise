class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:show, :edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to @user, notice: "Profil mis à jour"
    else
      render :edit
    end
  end

  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path, alert: "Accès interdit" unless @user == current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description)
  end
end