# frozen_string_literal: true

class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user.QA?
        scope.all
      elsif user.Manager?
        scope.where(manager_id: user.id)
      else
        scope.where(id: user.project_enrollments.select(:project_id))
      end
    end
  end

  def show?
    user.QA? || (user.Manager? && user.projects.include?(record))
  end

  def create?
    user.Manager?
  end

  def new?
    create?
  end

  def update?
    user.Manager? && user.projects.include?(record)
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end
