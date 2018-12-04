class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    #only course owners can update it
    # record - course
    # user - current_user
    record.user == user
  end

  def create?
    user.role.publisher?
  end

  def destroy?
    update?
  end

end
