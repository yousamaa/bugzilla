class Ticket < ApplicationRecord
  enum type: { Bug: 'Bug', Feature: 'Feature' }
end
