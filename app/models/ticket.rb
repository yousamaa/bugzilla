class Ticket < ApplicationRecord
  enum type: { bug: 'Bug', feature: 'Feature' }

  belongs_to :project
end
