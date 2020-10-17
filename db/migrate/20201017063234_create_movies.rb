class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.boolean :is_sctive
      t.integer :duration

      t.timestamps
    end
  end
end
