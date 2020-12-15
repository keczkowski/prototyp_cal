class CreateUCases < ActiveRecord::Migration[6.0]
  def change
    create_table :u_cases do |t|
      t.string :title
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
