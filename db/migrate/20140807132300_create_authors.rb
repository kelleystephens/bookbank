class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :f_name
      t.string :l_name
    end
  end
end
