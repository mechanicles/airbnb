class AddFeaturedColumnToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :featured, :boolean, default: false
  end
end
