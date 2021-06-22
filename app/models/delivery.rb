class Delivery < ApplicationRecord
  belongs_to :user
  has_many :delivery_products
end
