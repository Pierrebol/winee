class Delivery < ApplicationRecord
  belongs_to :user
  has_many :delivery_products
  has_many :wines, through: :delivery_products
end
