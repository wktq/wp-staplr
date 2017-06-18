class CreateSites < ActiveRecord::Migration[5.1]
  def change
    create_table :sites do |t|
      t.string :name
      t.string :url
      t.string :password
      t.string :username
      t.string :xmlrpc_path
      t.boolean :ssl
      t.string :ssl_port

      t.timestamps
    end
  end
end
