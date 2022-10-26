# frozen_string_literal: true

class TicketPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      return unless user.QA?

      scope.where(creator_id: user.id)
    end
  end

  def index?
    user.QA?
  end

  def show?
    return user.tickets.include?(record) unless user.Manager?

    false
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
