class Bug < Ticket
  enum status: { neww: 'New', started: 'Started', resolved: 'Resolved' }

  belongs_to :developer
end
