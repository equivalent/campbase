class Entry < ApplicationRecord
  belongs_to :project
  belongs_to :creator, class_name: "User"

  delegated_type :entryable, types: %w[Event Comment], dependent: :destroy

  # todo: make the broadcasts secure like https://www.hotrails.dev/turbo-rails/turbo-streams-security
  broadcasts_to ->(entry) { "entries" }, inserts_by: :append
end
