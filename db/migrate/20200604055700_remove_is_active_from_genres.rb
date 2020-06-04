class RemoveIsActiveFromGenres < ActiveRecord::Migration[5.2]
  def change
    remove_column :genres, :is_active, :boolean
  end
end
