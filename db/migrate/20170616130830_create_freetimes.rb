class CreateFreetimes < ActiveRecord::Migration
  def change
    create_table :freetimes do |t|
      t.integer :owner_id
      t.integer :client_id
      t.datetime :time
      t.string :place

      t.timestamps null: false
    end
  end
end
