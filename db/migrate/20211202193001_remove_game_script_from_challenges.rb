class RemoveGameScriptFromChallenges < ActiveRecord::Migration[6.1]
  def change
    remove_column :challenges, :game_script
  end
end
