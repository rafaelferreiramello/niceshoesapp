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
    user.has_role? :admin
  end

  def new?
    create?
  end

  def update?
    user.has_role? :admin #or if the current_user is the shoe owner
  end

  def edit?
    update?
  end

  def destroy?
    user.has_role? :admin
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
