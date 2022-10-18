class Project < ApplicationRecord
  has_many :tickets, dependent: :destroy
  has_many :project_enrollments, dependent: :destroy
  has_many :managers, through: :project_enrollments
end
