class RemoveNameFromGenres < ActiveRecord::Migration[5.2]
  def change
    remove_column :genres, :name, :integer
  end
end
