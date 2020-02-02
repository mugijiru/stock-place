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

class VisitedPlaceReport < ApplicationRecord
  extend Enumerize

  belongs_to :visited_place, foreign_key: 'place_id'

  validates :visited_on, presence: true
  validate :validate_today_or_past_date
  validates :point, presence: true, numericality: { only_integer: true }

  enumerize :point, in: { no_good: -1, no_comment: 0, not_bad: 1, good: 2 }, scope: :having_point

  private

  def validate_today_or_past_date
    return unless visited_on.present?

    errors.add(:visited_on, '未来の日付を選択することはできません') if visited_on > Date.today
  end
end
