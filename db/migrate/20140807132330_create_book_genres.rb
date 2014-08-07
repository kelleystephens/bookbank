class CreateBookGenres < ActiveRecord::Migration
  def change
    create_table :book_genres do |t|
      t.references :book
      t.references :genre
    end
  end
end
