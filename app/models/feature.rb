class Feature < Ticket
  enum status: { neww: 'New', started: 'Started', completed: 'Completed' }
end
