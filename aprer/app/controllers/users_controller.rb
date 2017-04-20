class UsersController < ApplicationController

  #before_action :set_user, only: [:update, :edit, :update, :destroy]

  def index
    if admin_signed_in?
      @user = User.all.order("created_at DESC")
    else
      redirect_to new_admin_session_path
    end
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path, notice: "Utilisateur modifié avec succès !"
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "Utilisateur supprimé avec succès !"
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :approved)
  end

  #def set_user
  #  @user = User.find(params[:id])
  #end
end
