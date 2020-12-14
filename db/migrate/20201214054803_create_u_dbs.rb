class CreateUDbs < ActiveRecord::Migration[6.0]
  def change
    create_table :u_dbs do |t|
      t.string :name
      t.string :password
      t.string :username
      t.integer :server_id

      t.timestamps
    end
  end
end
