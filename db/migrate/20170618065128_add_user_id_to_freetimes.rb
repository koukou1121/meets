class AddUserIdToFreetimes < ActiveRecord::Migration
  def change
    rename_column :freetimes, :owner_id, :user_id
  end
end
