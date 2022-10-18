class Manager < User
  has_many :project_managements
  has_many :projects, through: :project_managements
end
