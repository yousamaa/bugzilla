class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum type: { Developer: 'Developer', Manager: 'Manager', QA: 'QA' }
end
