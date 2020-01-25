module Api
  module V1
    class PlacesController < ApplicationController
      def index
        @places = Place.all
        render json: @places.to_json
      end

      def create
        @place = Place.new(place_params)

        @place.save!
        render json: @place, status: :created
      rescue ActiveRecord::RecordInvalid
        render json: { place: @place, errors: @place.errors.full_messages }, status: :unprocessable_entity
      end

      private

      def place_params
        params.require(:place).permit(:name, :address)
      end
    end
  end
end
