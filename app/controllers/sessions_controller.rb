class SessionsController < ApplicationController
  include SessionsHelper

  skip_before_action :logged_in_using_omniauth?

  def new
    redirect_to home_path if logged_in?
  end

  def destroy
    reset_session
    redirect_to auth0_logout_url.to_s
  end
end
