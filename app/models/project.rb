class Project < ApplicationRecord
  enum status: {
    open: "open",
    closed: "closed"
  }

  has_many :entries, dependent: :destroy
end
