class Review < ApplicationRecord
  belongs_to :visit
  belongs_to :user
  validates :description, presence: true
  validates :rating, inclusion: { in: 0..5 }
end
