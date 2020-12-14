class CreateUFtps < ActiveRecord::Migration[6.0]
  def change
    create_table :u_ftps do |t|
      t.string :name
      t.string :password
      t.string :home
      t.integer :server_id

      t.timestamps
    end
  end
end
