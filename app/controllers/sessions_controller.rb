class SessionsController < ApplicationController
  include SessionsHelper

  skip_before_action :logged_in_using_omniauth?

  def new
  end

  def destroy
    reset_session
    redirect_to auth0_logout_url.to_s
  end
end
