class Film < ApplicationRecord
  validates :title, presence: true
  validates :duration, presence: true
  validates :short_description, presence: true, length: {maximum:300}
  validates :genre, presence: true
  validates :director, presence: true, format: {with: / /}, length: {minimum: 6}
  validates :scenarist, presence: true, format: {with: / /}, length: {minimum: 6}
  validates :country, presence: true, length:{maximum: 20}

  has_many :reviews, dependent: :destroy

  def next_film
    Film.where("id > ?", id).order(:id).first
  end

  def previous_film
    Film.where("id < ?", id).order(id: :desc).first
  end
end
