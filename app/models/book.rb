class Book < ActiveRecord::Base
  has_many :authorships
  has_many :book_genres
  has_many :authors, through: :authorships
  has_many :genres, through: :book_genres

  validates_length_of :title, maximum: 30, message: "must be less than 30 characters"
  validates_presence_of :title
end
