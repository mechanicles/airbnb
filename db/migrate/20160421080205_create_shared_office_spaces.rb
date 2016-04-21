class CreateSharedOfficeSpaces < ActiveRecord::Migration
  def change
    create_table :shared_office_spaces do |t|
      t.integer :user_id, index: true, null: false
      t.integer :space_id, index: true, null: false
      t.boolean :publicly_shared, default: true

      t.timestamps null: false
    end
  end
end
