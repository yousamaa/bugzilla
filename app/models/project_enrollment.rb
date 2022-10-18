class ProjectManagement < ApplicationRecord
  belongs_to :developer, class_name: 'User'
  belongs_to :project
end
