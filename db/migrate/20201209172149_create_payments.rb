class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string :title
      t.string :name
      t.date :deadline
      t.float :price

      t.timestamps
    end
  end
end
