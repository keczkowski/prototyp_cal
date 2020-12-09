class CreateServers < ActiveRecord::Migration[6.0]
  def change
    create_table :servers do |t|
      t.integer :package_id
      t.string :name
      t.integer :disk_space
      t.boolean :paid
      t.date :paid_date
      t.integer :user_id

      t.timestamps
    end
  end
end
