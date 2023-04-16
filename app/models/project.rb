class Project < ApplicationRecord
  enum status: {
    open: "open",
    closed: "closed"
  }
end
