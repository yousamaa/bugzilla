# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum type: { Developer: 'Developer', Manager: 'Manager', QA: 'QA' }

  has_many :tickets, foreign_key: 'creator_id', inverse_of: :user, dependent: :nullify
end
