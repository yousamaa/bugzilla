# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :tickets,              dependent: :destroy
  has_many :project_enrollments,  dependent: :destroy
  has_many :developers,           through: :project_enrollments, class_name: 'User'

  belongs_to :manager,            class_name: 'User'

  validates :title, :description, presence: true
end
