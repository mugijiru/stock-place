class PlaceEvaluation < ApplicationRecord
  belongs_to :place

  validates :visited_on, presence: true
  validates :point, presence: true, numericality: { only_integer: true }
end
