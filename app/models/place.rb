class Place < ApplicationRecord
  has_many :evaluations, class_name: 'PlaceEvaluation'

  validates :name, presence: true
end
