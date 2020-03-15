class SessionsController < ApplicationController
  skip_before_action :logged_in_using_omniauth?

  def new
  end
end
