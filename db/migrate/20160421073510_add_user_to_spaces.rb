class AddUserToSpaces < ActiveRecord::Migration
  def change
    add_reference :spaces, :user, index: true, foreign_key: true
  end
end
