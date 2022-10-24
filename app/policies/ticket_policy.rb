# frozen_string_literal: true

class TicketPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user.QA?
        scope.all
      else
        scope.where(assigned_to_id: user.id) && scope.where(assigned_to_id: nil)
      end
    end
  end

  def show?
    user.tickets.include?(record)
  end

  def create?
    user.QA?
  end

  def new?
    create?
  end

  def update?
    user.QA? || user.Developer?
  end

  def edit?
    update?
  end

  def destroy?
    user.QA? && user.tickets.include?(record)
  end
end
