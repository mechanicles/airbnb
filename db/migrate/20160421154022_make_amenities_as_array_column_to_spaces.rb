class MakeAmenitiesAsArrayColumnToSpaces < ActiveRecord::Migration
  def up
    change_column :spaces, :amenities, :text, array: true, default: [],
      using: "(string_to_array(amenities, ','))"
  end

  def down
    remove_column :spaces, :amenities
    add_column :spaces, :amenities, :text
  end
end
