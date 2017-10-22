class AddColumnToFreetime < ActiveRecord::Migration
  def change
    add_column :freetimes, :limitnum, :integer
  end
end
