class Review < ApplicationRecord
  belongs_to :wine
  belongs_to :user

  validates :comment, presence: true, length: { minimum: 3 }
  validates :rating, presence: true, length: { is: 1 }
end
