class Visit < ApplicationRecord
  geocoded_by :place
  after_validation :geocode, if: :will_save_change_to_place?
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :place, presence: true
  validates :photo, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_place_and_title,
    against: [ :place, :title ],
    using: {
      tsearch: { prefix: true } 
    }
end
