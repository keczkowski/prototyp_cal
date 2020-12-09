class CreateDomains < ActiveRecord::Migration[6.0]
  def change
    create_table :domains do |t|
      t.string :name
      t.integer :server_id
      t.integer :user_id

      t.timestamps
    end
  end
end
