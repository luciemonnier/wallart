class CategoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user_admin_or_logged?
  end

  private

  def user_admin_or_logged?
    user.admin == true || record.user == user
  end
end
