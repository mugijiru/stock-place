class PlaceEvaluation < ApplicationRecord
  extend Enumerize

  belongs_to :place

  validates :visited_on, presence: true
  validates :point, presence: true, numericality: { only_integer: true }

  enumerize :point, in: { no_good: -1, no_comment: 0, not_bad: 1, good: 2 }
end
