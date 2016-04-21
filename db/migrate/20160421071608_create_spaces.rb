class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.string :name, null: false
      t.text :address, null: false
      t.text :description
      t.integer :total_seats
      t.string :start_time
      t.string :end_time
      t.text :amenities

      t.timestamps null: false
    end
  end
end
