class ChangeColumnsInSpaces < ActiveRecord::Migration
  def change
    remove_column :spaces, :cost_per_seat, :integer
    remove_column :spaces, :seating_period, :string

    add_column :spaces, :cost_per_seat_per_day, :float
    add_column :spaces, :cost_per_seat_per_week, :float
    add_column :spaces, :cost_per_seat_per_month, :float
  end
end
