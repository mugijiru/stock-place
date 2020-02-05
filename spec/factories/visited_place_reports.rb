# == Schema Information
#
# Table name: visited_place_reports
#
#  id               :bigint           not null, primary key
#  visited_place_id :bigint           not null
#  visited_on       :date             not null
#  evaluation       :integer          default("no_comment"), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryBot.define do
  factory :visited_place_report do
    visited_place { nil }
    visited_on { Date.today }
    point { :good }
  end
end
