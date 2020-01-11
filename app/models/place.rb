class Place < ApplicationRecord
  has_many :evaluations, class_name: 'PlaceEvaluation', inverse_of: :place

  validates :name, presence: true

  def self.recently_visited
    joins('LEFT JOIN place_evaluations ON places.id = place_evaluations.place_id').
      group('places.id').select('places.*', "COALESCE(MAX(place_evaluations.visited_on), '1900-01-01') AS last_visited_on").order(last_visited_on: :desc)
  end
end
