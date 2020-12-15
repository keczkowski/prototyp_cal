class AddForwardToUEmails < ActiveRecord::Migration[6.0]
  def change
    add_column :u_emails, :forward_to, :string
  end
end
