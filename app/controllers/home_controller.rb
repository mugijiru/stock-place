class HomeController < ApplicationController
  def index
    @grouped_evaluations = {
      good: PlaceEvaluation.having_point(:good).order(id: :desc).limit(10),
      not_bad: PlaceEvaluation.having_point(:not_bad).order(id: :desc).limit(10),
    }
  end
end
