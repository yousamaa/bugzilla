class Feature < Ticket
  enum status: { neww: 'New', started: 'Started', completed: 'Completed' }

  belongs_to :developer
end
