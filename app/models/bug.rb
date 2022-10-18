class Bug < Ticket
  enum status: { neww: 'New', started: 'Started', resolved: 'Resolved' }
end
