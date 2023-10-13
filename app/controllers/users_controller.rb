class UsersController < ApplicationController

  # Create 'new' action for UsersController
  def new
  end

  # Build 'create' action for UsersController
  def create  
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to :root, notice: 'User created!'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end