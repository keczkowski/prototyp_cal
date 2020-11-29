class CreateConcepts < ActiveRecord::Migration[6.0]
  def change
    create_table :concepts do |t|
      t.string :name
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
