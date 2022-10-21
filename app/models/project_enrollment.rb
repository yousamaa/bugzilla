# frozen_string_literal: true

class ProjectEnrollment < ApplicationRecord
  belongs_to :developer, class_name: 'User'
  belongs_to :project
end
