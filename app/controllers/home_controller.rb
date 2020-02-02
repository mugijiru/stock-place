class HomeController < ApplicationController
  def index
    @grouped_evaluations = {
      good: VisitedPlaceReport.having_point(:good).eager_load(:visited_place).order(id: :desc).limit(10),
      not_bad: VisitedPlaceReport.having_point(:not_bad).eager_load(:visited_place).order(id: :desc).limit(10),
    }
  end
end
