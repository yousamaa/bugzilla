class Bug < Ticket
  enum status: { neww: 'New', started: 'Started', resolved: 'Resolved' }

  belongs_to :developer, class_name: 'User', foreign_key: 'assigned_to_id', inverse_of: :bugs
end
