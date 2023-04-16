class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :project, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
