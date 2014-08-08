class Author < ActiveRecord::Base
  has_many :authorships
  has_many :books, through: :authorships

  validates_format_of :f_name, with: /[a-zA-Z]/, message: "must include letters"
  validates_length_of :f_name, maximum: 30, message: "must be less than 30 characters"
  validates_presence_of :f_name
  
end
