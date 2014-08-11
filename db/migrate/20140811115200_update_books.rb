class UpdateBooks < ActiveRecord::Migration
  def change
    change_table :books do |t|
      t.remove :read
      t.string :is_read
    end
  end
end
