class Project < ApplicationRecord
  has_many :tickets,              dependent: :destroy
  has_many :project_enrollments,  dependent: :destroy
  has_many :developers,           through: :project_enrollments, class_name: 'User'

  belongs_to :manager,            class_name: 'User', foreign_key: 'creator_id', inverse_of: :projects
end
