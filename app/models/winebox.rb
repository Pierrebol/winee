class Winebox < ApplicationRecord
  belongs_to :wine
  belongs_to :user
  validates :quantity_of_wine, presence: true
  validates :quantity_of_wine, numericality: { only_integer: true, greater_than: 0 }
end
