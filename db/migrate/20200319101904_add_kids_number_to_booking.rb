class AddKidsNumberToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :kids_number, :integer
  end
end
