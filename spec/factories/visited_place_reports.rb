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

FactoryBot.define do
  factory :visited_place_report do
    visited_place { nil }
    visited_on { Date.today }
    point { :good }
  end
end
