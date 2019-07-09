class PackagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  private

  def user_admin_or_logged?
    user.admin == true || record.user == user
  end
end
