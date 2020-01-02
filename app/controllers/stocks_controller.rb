class StocksController < ApplicationController
  def index
    @places = Place.order(id: :desc).all
  end
end
