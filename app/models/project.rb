class Project < ApplicationRecord
  has_many :tickets
  has_many :project_enrollments
  has_many :managers, through: :project_enrollments

  belongs_to :manager, class_name: 'User', foreign_key: 'creator_id', inverse_of: :projects
end
