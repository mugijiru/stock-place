class PlaceItem < ApplicationRecord
  belongs_to :place

  validates :name, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
end
