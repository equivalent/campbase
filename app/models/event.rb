class Event < ApplicationRecord
  include EntryableConcern

  enum occasion: {
    project_closed: "project_closed",
    project_opened: "project_opened"
  }

  validates :occasion, presence: true
end
