class AddGenreToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :genre, :integer
  end
end
