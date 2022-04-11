class AddCoordinatesToNannies < ActiveRecord::Migration[5.2]
  def change
    add_column :nannies, :latitude, :float
    add_column :nannies, :longitude, :float
  end
end
