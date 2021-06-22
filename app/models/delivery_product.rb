class DeliveryProduct < ApplicationRecord
  belongs_to :delivery
  belongs_to :wine
end
