class Entry < ApplicationRecord
  belongs_to :project
  delegated_type :entryable, types: %w[ Event Comment ], dependent: :destroy

  broadcasts_to ->(entry) { "entries" }, inserts_by: :append
end
