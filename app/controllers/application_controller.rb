# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery
  NotAuthenticated = Class.new(StandardError)

  before_action :authenticate!
  helper_method :current_user

  rescue_from NotAuthenticated do
    redirect_to login_path, error: 'Not authenticated'
  end

  private

  def authenticate!
    @current_user ||= User.find(session[:user_id])
  rescue ActiveRecord::RecordNotFound
    raise NotAuthenticated
  end

  attr_reader :current_user
end
