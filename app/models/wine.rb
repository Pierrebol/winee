class Wine < ApplicationRecord
  belongs_to :designation
  has_one_attached :photo
  has_many :order_wines
  has_many :delivery_products
  has_many :cellars
  has_many :reviews

  validates :name, presence: true
  validates :grape_variety, presence: true
  validates :vineyard, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :category, presence: true
  validates :price, presence: true
  validates :photo, presence: true
  validates :designation_id, presence: true
  validates :country, presence: true
  validates :year, presence: true
end
