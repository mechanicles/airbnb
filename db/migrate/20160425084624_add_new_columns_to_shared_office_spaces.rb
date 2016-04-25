class AddNewColumnsToSharedOfficeSpaces < ActiveRecord::Migration
  def change
    add_column :shared_office_spaces, :period,  :string
    add_column :shared_office_spaces, :period_start_date, :datetime
    add_column :shared_office_spaces, :period_end_date, :datetime
    add_column :shared_office_spaces, :recurring, :boolean, defualt: false
  end
end
