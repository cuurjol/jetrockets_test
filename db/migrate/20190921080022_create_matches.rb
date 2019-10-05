class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.string :name
      t.string :city
      t.references :home_team, foreign_key: false, index: false
      t.references :guest_team, foreign_key: false

      t.timestamps
    end
    add_index :matches, :name, unique: true
    add_index :matches, %i[home_team_id guest_team_id], unique: true
  end
end
