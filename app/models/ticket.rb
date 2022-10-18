class Ticket < ApplicationRecord
  enum type: { bug: 'Bug', feature: 'Feature' }

  belongs_to :user,       foreign_key: 'creator_id', inverse_of: :tickets
  belongs_to :developer,  class_name: 'User', foreign_key: 'assigned_to_id', inverse_of: :bugs
  belongs_to :project

  has_one_attached :screen_shot
end
