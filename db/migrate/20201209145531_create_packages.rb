class CreatePackages < ActiveRecord::Migration[6.0]
  def change
    create_table :packages do |t|
      t.string :name
      t.integer :disk_space
      t.float :price
      t.text :body

      t.timestamps
    end
  end
end
