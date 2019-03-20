class UploadPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def new?
    true
  end

  def create?
    new?
  end

  def destroy?
    user_admin_or_logged?
  end

  def update?
    true
  end

  def index?
    true
  end

  private

  def user_admin_or_logged?
    user.admin == true || record.user == user
  end
end
