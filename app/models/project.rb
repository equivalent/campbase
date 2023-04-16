class Project < ApplicationRecord
  enum status: {
    open: "open",
    closed: "closed"
  }

  has_many :comments, dependent: :destroy
end
