class AddColumnToSites < ActiveRecord::Migration[5.1]
  def change
    add_column :sites, :user_id, :string
    add_column :sites, :raw_info, :string
  end
end
