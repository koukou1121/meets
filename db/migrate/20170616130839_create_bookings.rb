class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :owner_id
      t.integer :client_id

      t.timestamps null: false
    end
  end
end
