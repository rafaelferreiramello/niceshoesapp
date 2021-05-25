class ShoePolicy
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
      true
    end
  
    def new?
      true
    end
  
    def update?
      is_owner?
    end
  
    def edit?
      is_owner?
    end
  
    def destroy?
      is_owner?
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