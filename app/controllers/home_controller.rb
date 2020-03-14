class HomeController < ApplicationController
  def index
    @grouped_reports = {
      good: VisitedPlaceReport.having_evaluation(:good).eager_load(:visited_place).order(id: :desc).limit(10),
      not_bad: VisitedPlaceReport.having_evaluation(:not_bad).eager_load(:visited_place).order(id: :desc).limit(10),
    }
  end
end
