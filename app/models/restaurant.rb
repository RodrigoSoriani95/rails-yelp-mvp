class Restaurant < ApplicationRecord
  CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]
  validates :category, inclusion: { in: CATEGORIES }
  has_many :reviews, dependent: :destroy # dependent, quando o rest é destruido, a review tbm sera
  validates :name, :address, presence: true, uniqueness: true

end

