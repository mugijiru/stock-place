module Api
  module V1
    class PlacesController < ApplicationController
      def index
        @places = if params[:q].blank?
                    VisitedPlace.all
                  else
                    VisitedPlace.where('name LIKE ?', "%#{params[:q]}%")
                  end
      end

      def create
        @place = VisitedPlace.new(place_params)

        @place.save!
        render :show, status: :created, location: place_url(@place)
      rescue ActiveRecord::RecordInvalid
        render json: { errors: @place.errors.full_messages }, status: :unprocessable_entity
      end

      private

      def place_params
        params.require(:place).permit(:name, :address)
      end
    end
  end
end
