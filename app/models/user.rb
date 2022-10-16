class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { developer: 'developer', manager: 'manager', qa: 'qa' }, _default: 'developer'
end
