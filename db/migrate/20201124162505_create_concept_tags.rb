class CreateConceptTags < ActiveRecord::Migration[6.0]
  def change
    create_table :concept_tags do |t|
      t.integer :concept_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
