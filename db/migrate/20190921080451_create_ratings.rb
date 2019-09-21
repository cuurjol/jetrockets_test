class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.references :player, foreign_key: true
      t.references :achievement, foreign_key: true
      t.references :match, foreign_key: true

      t.timestamps
    end
  end
end
