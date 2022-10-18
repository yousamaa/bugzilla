class ProjectManagement < ApplicationRecord
  belongs_to :Manager
  belongs_to :project
end
