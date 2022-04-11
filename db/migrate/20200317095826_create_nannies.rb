class CreateNannies < ActiveRecord::Migration[5.2]
  def change
    create_table :nannies do |t|
      t.integer :price_per_hour
      t.string :description
      t.integer :age
      t.integer :experience_level
      t.string :certification
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
