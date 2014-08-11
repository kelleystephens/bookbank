class Genre < ActiveRecord::Base
  has_many :book_genres
  has_many :books, through: :book_genres

  validates_format_of :name, with: /[a-zA-Z]/, message: "must include letters"
  validates_length_of :name, maximum: 30, message: "must be less than 30 characters"
  validates_presence_of :name
  validates_uniqueness_of :name
  
end
