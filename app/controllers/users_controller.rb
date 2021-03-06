class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(set_params)
    if @user.save
      redirect_to user_path(@user.id), notice: "登録できました"
    else
      render :new
    end
  end

  def destroy
    @user = User.destroy(params[:id])
    redirect_to new_user_path
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def set_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end