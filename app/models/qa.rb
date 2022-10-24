# frozen_string_literal: true

class QA < User
  has_many :tickets, foreign_key: 'creator_id', dependent: :nullify
end
