class CreateDnsRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :dns_records do |t|
      t.string :dtype
      t.string :name
      t.integer :ttl
      t.integer :domain_id
      t.string :value

      t.timestamps
    end
  end
end
