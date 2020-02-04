class EventPolicy < ApplicationPolicy
  def edit?
    user_is_owner?(record)
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end

  def show?

  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  private

  def user_is_owner?(event)
    user.present? && (event.try(:user) == user)
  end
end
