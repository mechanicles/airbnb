class AddSeatRelatedFieldsToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :cost_per_seat, :integer
    add_column :spaces, :seating_period, :string
  end
end
