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

FactoryBot.define do
  factory :visited_place do
    name { "どこか" }
    address { "東京都どこか区どこか1-23-5" }
  end
end
