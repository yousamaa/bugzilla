class Developer < User
  has_many :tickets,              foreign_key: 'assigned_to_id', inverse_of: :developer, dependent: :nullify
  has_many :project_enrollments,  dependent: :destroy
  has_many :projects,             through: :project_enrollments
end
