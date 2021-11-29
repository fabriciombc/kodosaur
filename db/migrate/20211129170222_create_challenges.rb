class CreateChallenges < ActiveRecord::Migration[6.1]
  def change
    create_table :challenges do |t|
      t.text :objective, null: false
      t.text :game_script, null: false
      t.timestamps
    end
  end
end
