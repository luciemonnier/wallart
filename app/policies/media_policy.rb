class MediaPolicy < ApplicationPolicy
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

  def new?
    user_admin?
  end

  def create
    new?
  end

  def edit
    user_admin?
  end

  def update
    edit?
  end

  def destroy?
    user_admin?
  end

  private

  def user_admin_or_logged?
    user.admin == true || record.user == user
  end

  def user_admin?
    user.admin == true
  end
end

