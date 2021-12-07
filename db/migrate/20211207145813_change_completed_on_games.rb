class ChangeCompletedOnGames < ActiveRecord::Migration[6.1]
  def change
    change_column :games, :completed, :boolean, :default => false
  end
end
