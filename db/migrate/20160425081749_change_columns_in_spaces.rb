class ChangeColumnsInSpaces < ActiveRecord::Migration
  def change
    remove_column :spaces, :cost_per_seat
    remove_column :spaces, :seating_period

    add_column :spaces, :cost_per_seat_per_day, :float
    add_column :spaces, :cost_per_seat_per_week, :float
    add_column :spaces, :cost_per_seat_per_month, :float
  end
end
