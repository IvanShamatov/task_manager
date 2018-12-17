# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authenticate!

  # GET /users/new
  def signup
    @user = User.new
  end

  # POST /users
  def register
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to tasks_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
