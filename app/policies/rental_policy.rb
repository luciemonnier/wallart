class RentalPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def index?
    user_admin_or_logged?
  end

  def create?
    user_admin_or_logged?
  end

  def update?
    user_admin_or_logged?
  end

  private

  def user_admin_or_logged?
    user.admin == true || record.user == user
  end
end
