class Developer < User
  has_many :bugs, class_name: 'User', foreign_key: 'assigned_to_id', inverse_of: :developer, dependent: :destroy
  has_many :project_enrollments
  has_many :projects, through: :project_enrollments
end
