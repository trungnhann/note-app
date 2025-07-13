class TaskPolicy < ApplicationPolicy
  def index?
    owner?
  end

  def show?
    owner?
  end

  def create?
    owner?
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  class Scope < Scope
    def resolve
      scope.includes(:project).where(projects: { user_id: user.id })
    end
  end

  private

  def owner?
    record.user == user
  end
end
