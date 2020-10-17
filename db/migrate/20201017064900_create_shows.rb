class CreateShows < ActiveRecord::Migration[6.0]
  def change
    create_table :shows do |t|
      t.date :date
      t.datetime :start_time
      t.datetime :end_time
      t.references :screen, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
