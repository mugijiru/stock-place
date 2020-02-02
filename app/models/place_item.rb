# == Schema Information
#
# Table name: place_items
#
#  id         :bigint           not null, primary key
#  place_id   :bigint           not null
#  name       :string           not null
#  price      :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PlaceItem < ApplicationRecord
  belongs_to :visited_place, foreign_key: 'place_id'

  validates :name, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
end
