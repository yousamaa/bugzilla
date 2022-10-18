class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum type: { developer: 'Developer', manager: 'Manager', qa: 'QA' }

  has_many :projects, foreign_key: :manager_id, dependent: :destroy
  has_many :tickets, dependent: :destroy
end
