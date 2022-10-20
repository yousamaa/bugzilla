# frozen_string_literal: true

class Bug < Ticket
  enum status: { New: 'New', Started: 'Started', Resolved: 'Resolved' }
end
