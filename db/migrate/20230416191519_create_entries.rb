class CreateEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :entries do |t|
      t.references :project, null: false, foreign_key: true
      t.string :entryable_type
      t.integer :entryable_id

      t.timestamps
    end
  end
end
