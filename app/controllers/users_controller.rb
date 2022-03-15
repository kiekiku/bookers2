class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    flash[:notice] = "You have updated user successfully."
    if @user == current_user
         render :edit
    else
       @user = current_user
         redirect_to user_path(correct_user.id)
    end
  end

  def update
    @user = current_user
    @user.update(user_params)
    if @user.update(user_params)
        flash[:notice] = "You have updated user successfully."
        redirect_to user_path(@user.id)
    else
        @user = current_user
        render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
end
