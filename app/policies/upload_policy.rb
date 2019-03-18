class UploadPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def new?
    user_admin_or_logged?
  end

  def create?
    new?
  end

  def destroy?
    user_admin_or_logged?
  end

  private

  def user_admin_or_logged?
    user.admin == true || current_user != nil
  end
end
