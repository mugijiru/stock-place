# == Schema Information
#
# Table name: visited_places
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class VisitedPlace < ApplicationRecord
  has_many :reports, class_name: 'VisitedPlaceReport', inverse_of: :visited_place

  validates :name, presence: true

  def self.recently_visited
    joins('LEFT JOIN visited_place_reports ON visited_places.id = visited_place_reports.visited_place_id').
      group('visited_places.id').select('visited_places.*', "COALESCE(MAX(visited_place_reports.visited_on), '1900-01-01') AS last_visited_on").order(last_visited_on: :desc)
  end
end
