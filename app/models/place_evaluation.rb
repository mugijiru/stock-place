# == Schema Information
#
# Table name: place_evaluations
#
#  id         :bigint           not null, primary key
#  place_id   :bigint           not null
#  visited_on :date             not null
#  point      :integer          default("no_comment"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PlaceEvaluation < ApplicationRecord
  extend Enumerize

  belongs_to :place

  validates :visited_on, presence: true
  validates :point, presence: true, numericality: { only_integer: true }

  enumerize :point, in: { no_good: -1, no_comment: 0, not_bad: 1, good: 2 }, scope: :having_point
end
