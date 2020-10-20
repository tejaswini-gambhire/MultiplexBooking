require 'rails_helper'

RSpec.describe "Bookings", type: :request do

  describe "GET /index" do
    it "should not be accessible if user is not signed in"

    it "returns http success for admin" do
      get "/bookings/index"
      expect(response).to have_http_status(:success)
    end

    it "returns unauthorized for customer"

    it "returns list of bookings for the particular date"

    it "returns todays bookings by default"

    it "returns bookings for a particular screen"
  end

end
