class AddNewAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :description, :text
    add_column :users, :phone_number, :string
    add_column :users, :address, :text
    add_column :users, :company_name, :string
  end
end
