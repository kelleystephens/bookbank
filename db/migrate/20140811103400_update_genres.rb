class UpdateGenres < ActiveRecord::Migration
  def change
    change_table :genres do |t|
      t.rename :type, :name
    end
  end
end
