class MoviePolicy
  attr_reader :user, :movie

  def initialize(user, movie)
    @user = user
    @movie = movie
  end

  def index?
    @user.is_admin? || @user.is_customer?
  end

  def shows?
    @user.is_admin? || @user.is_customer?
  end
end