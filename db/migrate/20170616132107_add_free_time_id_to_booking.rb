class AddFreeTimeIdToBooking < ActiveRecord::Migration
  def change
    rename_column :bookings, :owner_id, :freetime_id
  end
end
