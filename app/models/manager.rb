class Manager < User
  has_many :projects, foreign_key: 'creator_id', inverse_of: :manager
end
