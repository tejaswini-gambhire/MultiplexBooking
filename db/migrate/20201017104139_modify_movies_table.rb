class ModifyMoviesTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :movies, :is_sctive, :is_active
    change_column_default :movies, :is_active, from: :null, to: false
  end
end
