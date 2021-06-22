class Order < ApplicationRecord
  belongs_to :user
  has_many :order_wines
  has_many :wines, through: :order_wines

end
