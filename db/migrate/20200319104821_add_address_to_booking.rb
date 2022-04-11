class AddAddressToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :address, :string
  end
end
