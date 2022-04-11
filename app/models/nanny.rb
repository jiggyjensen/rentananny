class Nanny < ApplicationRecord
  has_many :bookings
  has_many :reviews, through: :bookings
  belongs_to :user
  validates :user, uniqueness: true
  validates :price_per_hour, :description, :age, :city, presence: true
  has_one_attached :photo
  validates :city, presence: true
  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?
  include PgSearch::Model
  pg_search_scope :search_by_city,
  against: [ :city ],
  using: {
    tsearch: { prefix: true }
  }

end
