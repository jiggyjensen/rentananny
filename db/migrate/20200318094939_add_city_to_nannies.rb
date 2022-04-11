class AddCityToNannies < ActiveRecord::Migration[5.2]
  def change
    add_column :nannies, :city, :string
  end
end
