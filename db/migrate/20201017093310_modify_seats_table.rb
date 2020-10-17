class ModifySeatsTable < ActiveRecord::Migration[6.0]
  def change
    remove_reference :seats, :screen, null:false, foreign_key: true
    add_reference :seats, :show, null:false, foreign_key: true
    add_reference :seats, :booking, foreign_key: true
    add_column :seats, :position, :string
  end
end
