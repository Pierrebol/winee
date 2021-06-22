class OrderWine < ApplicationRecord
  belongs_to :order
  belongs_to :wine
end
