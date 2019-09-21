class CreateAchievements < ActiveRecord::Migration[5.2]
  def change
    create_table :achievements do |t|
      t.string :name
      t.integer :score

      t.timestamps
    end
    add_index :achievements, :name, unique: true
  end
end
