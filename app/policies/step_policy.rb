class StepPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def show?
    return true
  end

  def new?
    return true
  end

  def edit?
    return true
   end

  def update?
    return true
  end

  def destroy?
    return true
  end
end
