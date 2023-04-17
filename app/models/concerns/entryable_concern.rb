module EntryableConcern
  extend ActiveSupport::Concern

  included do
    has_one :entry, as: :entryable, touch: true, dependent: :destroy
  end

  delegate :project, to: :entry
end
