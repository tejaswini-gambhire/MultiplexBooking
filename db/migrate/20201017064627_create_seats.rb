class CreateSeats < ActiveRecord::Migration[6.0]
  def change
    create_table :seats do |t|
      t.string :name
      t.float :price
      t.references :screen, null: false, foreign_key: true

      t.timestamps
    end
  end
end
