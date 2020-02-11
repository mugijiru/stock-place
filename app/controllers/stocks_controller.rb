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

    respond_to do |format|
      if @place.save
        format.html { redirect_to place_path(@place), notice: 'VisitedPlace was successfully created.' }
        format.json { render :show, status: :created, location: place_path(@place.id) }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
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
