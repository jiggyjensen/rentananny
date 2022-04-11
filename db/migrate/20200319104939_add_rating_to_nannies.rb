class AddRatingToNannies < ActiveRecord::Migration[5.2]
  def change
    add_column :nannies, :rating, :integer
  end
end
