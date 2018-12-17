# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate!

  def new; end

  def create
    user = User.find_by(email: permitted_params[:email])
               .try(:authenticate, permitted_params[:password])
    if user
      flash[:notice] = "Welcome, #{user.email}"
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = 'Invalid email or password'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def permitted_params
    params.permit(:email, :password)
  end
end
