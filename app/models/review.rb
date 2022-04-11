class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :user
  validates :content, length: { minimum: 10 }, presence: true
  RATINGS = [1, 2, 3, 4, 5]
  validates :rating, presence: true, numericality: true, inclusion: {in:  RATINGS}
end
