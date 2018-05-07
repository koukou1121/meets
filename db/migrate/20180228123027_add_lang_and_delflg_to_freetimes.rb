class AddLangAndDelflgToFreetimes < ActiveRecord::Migration
  def change

add_column :freetimes, :lang, :integer
    add_column :freetimes, :flg, :integer

  end
end
