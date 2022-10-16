class Bug < ApplicationRecord
  enum type: { bug: 'bug', feature: 'feature' }, _default: 'bug'
  enum status: { new: 'new', started: 'started', completed: 'completed', resolved: 'resolved' }, _default: 'new'
end
