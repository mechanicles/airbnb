class AddForeignKeysToSharedOfficeSpaces < ActiveRecord::Migration
  def change
    add_foreign_key :shared_office_spaces, :users
    add_foreign_key :shared_office_spaces, :spaces
  end
end
