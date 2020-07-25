module Authenticatable
  extend ActiveSupport::Concern

  included do
    before_action :logged_in_using_omniauth?
  end

  def logged_in_using_omniauth?
    redirect_to '/' unless logged_in?
  end

  def logged_in?
    session[:userinfo].present?
  end
end
