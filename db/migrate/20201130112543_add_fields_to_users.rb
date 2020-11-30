class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :position, :string
    add_column :users, :avatar, :string
    add_column :users, :access_tags, :boolean
    add_column :users, :access_concepts, :boolean
    add_column :users, :access_users, :boolean
  end
end
