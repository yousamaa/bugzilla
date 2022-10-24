# frozen_string_literal: true

class QA < User
  has_many :tickets, foreign_key: 'creator_id', inverse_of: :qa, dependent: :nullify
end
