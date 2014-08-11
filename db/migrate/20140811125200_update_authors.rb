class UpdateAuthors < ActiveRecord::Migration
  def change
    change_table :authors do |t|
      t.rename :f_name, :name
      t.remove :l_name
    end
  end
end
