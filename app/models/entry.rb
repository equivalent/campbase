class Entry < ApplicationRecord
  belongs_to :project
  delegated_type :entryable, types: %w[ Event ]
end
