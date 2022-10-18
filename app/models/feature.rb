class Feature < Ticket
  enum status: { New: 'New', Started: 'Started', Completed: 'Completed' }
end
