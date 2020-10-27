class BookingPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user.is_admin?
  end

  def show?
    @record.user_id == current_user.id
  end

  def my_bookings?
    @user.is_customer?
  end
end