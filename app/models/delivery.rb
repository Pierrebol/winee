class Delivery < ApplicationRecord
  belongs_to :user
  has_many :delivery_products
  has_many :wines, through: :order_products
end
