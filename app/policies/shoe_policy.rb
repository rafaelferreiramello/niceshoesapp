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
      return true if user.has_role? :admin || Shoe.where(user_id: current_user.id) 
    end
  
    def edit?
      return true if user.has_role? :admin || Shoe.where(user_id: current_user.id) 
    end
  
    def destroy?
      return true if user.has_role? :admin || Shoe.where(user_id: current_user.id) 
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