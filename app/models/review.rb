class Review < ApplicationRecord
  validates :first_name, presence: true
  validates :surname, presence: true
  validates :rating, presence: true
  validates :short_opinion, presence: true, length: {maximum:200}

  belongs_to :film
end
