class BlogPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    [:admin, :editor].any? { |role| user.has_role? role }
  end

  def new?
    create?
  end

  def update?
    [:admin, :editor].any? { |role| user.has_role? role }
  end

  def edit?
    update?
  end

  def destroy?
    [:admin, :editor].any? { |role| user.has_role? role }
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
