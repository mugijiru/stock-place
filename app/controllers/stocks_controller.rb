class StocksController < ApplicationController
  # GET /stocks
  # GET /stocks.json
  def index
    @places = VisitedPlace.recently_visited
  end

  # GET /stocks/new
  def new
    @place = VisitedPlace.new
    @place_evaluation = @place.reports.build
  end

  # POST /stocks
  # POST /stocks.json
  def create
    @place = VisitedPlace.new(place_params)
    @place_evaluation = @place.reports.build(place_evaluation_params)

    if @place.save
      redirect_to visited_place_path(@place), notice: 'VisitedPlace was successfully created.'
    else
      render :new
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.fetch(:stock, {}).require(:place).permit(:name, :address)
    end

    def place_evaluation_params
      params.fetch(:stock, {}).require(:place_evaluation).permit(:visited_on, :evaluation)
    end
end
