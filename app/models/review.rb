class Review < ApplicationRecord
  belongs_to :restaurant

  validates :content, :rating, :restaurant_id, presence: true
  validates :rating, numericality: { only_integer: true }
  validates_associated :restaurant
  validates :rating, inclusion: { in: [*0..5] }
end
