class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  has_many :orders
  has_many :wineboxes
  has_many :reviews
  has_many :wines, through: :wineboxes
  has_many :deliveries

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: "Veuillez utilisez un format correct" }
end

