class ChangeDatatypeLangOfFreetimes< ActiveRecord::Migration
  def change
    change_column :freetimes, :lang, :string
  end
end
