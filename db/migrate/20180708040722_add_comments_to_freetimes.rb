class AddCommentsToFreetimes < ActiveRecord::Migration
  def change
    add_column :freetimes, :comments, :text
  end
end
