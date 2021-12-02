class AddLevelToChallenges < ActiveRecord::Migration[6.1]
  def change
    add_column :challenges, :level, :jsonb
  end
end
