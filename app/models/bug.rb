class Bug < ApplicationRecord
  enum type: { Bug: 'Bug', Feature: 'Feature' }
  enum status: { New: 'New', Started: 'Started', Completed: 'Completed', Resolved: 'Resolved' }
end
