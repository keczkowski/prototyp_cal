class AddResponderFieldsToUEmails < ActiveRecord::Migration[6.0]
  def change
    add_column :u_emails, :body, :text
    add_column :u_emails, :title, :string
  end
end
