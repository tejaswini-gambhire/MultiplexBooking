class AddSeatDistributionToScreen < ActiveRecord::Migration[6.0]
  def change
    add_column :screens, :seat_distribution, :jsonb, null: false, default: '{}'
    add_index  :screens, :seat_distribution, using: :gin
  end
end
