class Ticket < ApplicationRecord
  enum type: { bug: 'Bug', feature: 'Feature' }

  belongs_to :project
  belongs_to :user, foreign_key: 'creator_id', inverse_of: :tickets

  has_one_attached :screen_shot
end
