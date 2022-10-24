# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum type: { Developer: 'Developer', Manager: 'Manager', QA: 'QA' }

  validates :name, :email, :type, presence: true
  validates :email, uniqueness: true
end
