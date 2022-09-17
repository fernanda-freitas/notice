class KitPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user_id: user.id)
      #what user have accses to, and in controller its for display
    end
  end

  def create?
    record.user == user
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
