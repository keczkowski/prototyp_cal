class CreateUEmails < ActiveRecord::Migration[6.0]
  def change
    create_table :u_emails do |t|
      t.string :name
      t.string :password
      t.integer :disk_space
      t.integer :server_id

      t.timestamps
    end
  end
end
