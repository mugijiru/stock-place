class StocksController < ApplicationController
  # GET /stocks
  # GET /stocks.json
  def index
    @visited_places = VisitedPlace.recently_visited
  end

  # GET /stocks/new
  def new
    @visited_place = VisitedPlace.new
    @visited_place_report = @visited_place.reports.build
  end

  # POST /stocks
  # POST /stocks.json
  def create
    @visited_place = VisitedPlace.new(visited_place_params)
    @visited_place_report = @visited_place.reports.build(visited_place_report_params)

    if @visited_place.save
      redirect_to visited_place_path(@visited_place), notice: 'VisitedPlace was successfully created.'
    else
      render :new
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def visited_place_params
      params.fetch(:stock, {}).require(:visited_place).permit(:name, :address)
    end

    def visited_place_report_params
      params.fetch(:stock, {}).require(:visited_place_report).permit(:visited_on, :evaluation)
    end
end
