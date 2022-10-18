class Project < ApplicationRecord
  has_many :project_managements
  has_many :Managers, through: :project_managements
end
