class Review < ApplicationRecord
  belongs_to :restaurant
  validates :content, presence: true
  validates :rating, inclusion: { in: 0..5 }
  validates :rating, numericality: { only_integer: true }
end

#  validates :rating, inclusion: { in: [0,1,2,3], allow_nil: false } ???
