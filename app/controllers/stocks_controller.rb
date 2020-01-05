class StocksController < ApplicationController
  before_action :set_stock, only: [:edit, :update, :destroy]

  # GET /stocks
  # GET /stocks.json
  def index
    @places = Place.order(id: :desc).all
  end

  # GET /stocks/new
  def new
    @place = Place.new
    @place_evaluation = @place.evaluations.build
  end

  # POST /stocks
  # POST /stocks.json
  def create
    @place = Place.new(place_params)
    @place_evaluation = @place.evaluations.build(place_evaluation_params)

    respond_to do |format|
      if @place.save
        format.html { redirect_to place_path(@place), notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: place_path(@place.id) }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1
  # DELETE /stocks/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to stocks_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.fetch(:stock, {}).require(:place).permit(:name, :address)
    end

    def place_evaluation_params
      params.fetch(:stock, {}).require(:place_evaluation).permit(:visited_on, :point)
    end
end
