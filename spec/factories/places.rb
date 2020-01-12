# == Schema Information
#
# Table name: places
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :place do
    name { "どこか" }
    address { "東京都どこか区どこか1-23-5" }
  end
end
