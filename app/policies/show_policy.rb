class ShowPolicy
  attr_reader :user, :show

  def initialize(user, show)
    @user = user
    @show = show
  end

  def index?
    @user.is_admin? || @user.is_customer?
  end

  def seats?
    @user.is_admin? || @user.is_customer?
  end
end