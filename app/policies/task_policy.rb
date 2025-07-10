class TaskPolicy < ApplicationPolicy
  def index?
    record.project.user_id == user.id
  end

  def show?
    record.project.user_id == user.id
  end

  def create?
    record.project.user_id == user.id
  end

  def update?
    record.project.user_id == user.id
  end

  def destroy?
    record.project.user_id == user.id
  end

  class Scope < Scope
    def resolve
      scope.joins(:project).where(projects: { user_id: user.id })
    end
  end
end
