class RemoveRatingFromNannies < ActiveRecord::Migration[5.2]
  def change
    remove_column :nannies, :rating
  end
end
