class DeliveryProduct < ApplicationRecord
  belongs_to :delivery
  belongs_to :wine
  validates :quantity_of_wine, presence: true
  validates :quantity_of_wine, numericality: { only_integer: true, greater_than: 0}
end
