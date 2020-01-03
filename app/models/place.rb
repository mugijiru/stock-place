class Place < ApplicationRecord
  has_many :evaluations, class_name: 'PlaceEvaluation', inverse_of: :place

  validates :name, presence: true
end
