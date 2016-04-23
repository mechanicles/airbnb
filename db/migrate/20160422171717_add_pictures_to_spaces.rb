class AddPicturesToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :pictures, :text, array: true, default: []
  end
end
