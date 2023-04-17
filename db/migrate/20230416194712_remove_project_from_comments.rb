class RemoveProjectFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_reference :comments, :project, null: false, foreign_key: true
  end
end
