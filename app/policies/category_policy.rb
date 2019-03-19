class CategoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user_admin_or_logged?
  end

  def portrait?
    true
  end

  private

  def user_admin_or_logged?
    user.admin == true || user != nil
  end
end
