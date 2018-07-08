class AddPlaceToFreetimes < ActiveRecord::Migration
  def change
    change_column :freetimes, :place, :text
  end
end
