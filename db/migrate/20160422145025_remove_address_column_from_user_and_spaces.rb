class RemoveAddressColumnFromUserAndSpaces < ActiveRecord::Migration
  def change
    remove_column :users, :address, :text
    remove_column :spaces, :address, :text
  end
end
