# frozen_string_literal: true

class Ticket < ApplicationRecord
  enum type: { Bug: 'Bug', Feature: 'Feature' }

  belongs_to :developer,  class_name: 'User', foreign_key: 'assigned_to_id', inverse_of: :tickets, optional: true
  belongs_to :qa,         class_name: 'User', foreign_key: 'creator_id'
  belongs_to :project

  has_one_attached :screen_shot

  validates :title, :type, :status, presence: true
  validates :title, uniqueness: { scope: :project }

  def screen_shot_thumbnail
    screen_shot
  end
end
