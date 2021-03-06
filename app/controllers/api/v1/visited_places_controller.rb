module Api
  module V1
    class VisitedPlacesController < ApplicationController
      def index
        @places = if params[:q].blank?
                    VisitedPlace.all
                  else
                    VisitedPlace.where('name LIKE ?', "%#{params[:q]}%")
                  end
      end

      def create
        @place = VisitedPlace.new(visited_place_params)

        @place.save!
        render :show, status: :created, location: visited_place_url(@place)
      rescue ActiveRecord::RecordInvalid
        render json: { errors: @place.errors.full_messages }, status: :unprocessable_entity
      end

      private

      def visited_place_params
        params.require(:visited_place).permit(:name, :address)
      end
    end
  end
end
