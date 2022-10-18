class Developer < User
  has_many :bugs, foreign_key: :creator_id, dependent: :destroy, inverse_of: :bugs
  has_many :project_enrollments, dependent: :destroy
  has_many :projects, through: :project_enrollments
end
