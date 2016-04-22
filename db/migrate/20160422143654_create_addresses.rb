class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :country
      t.references :addressable, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
