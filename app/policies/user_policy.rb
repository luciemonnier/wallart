class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def show?
    true
  end

  def edit?
    true
  end

  def update
    true
  end

  private

  def user_admin_or_logged?
    user.admin == true || record.user == user
  end
end
