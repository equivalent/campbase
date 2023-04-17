class Comment < ApplicationRecord
  include EntryableConcern

  validates :description, presence: true
end
