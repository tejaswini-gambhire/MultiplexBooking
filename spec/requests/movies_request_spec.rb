require 'rails_helper'

RSpec.describe "Movies", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/movies/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /shows" do
    it "returns http success" do
      get "/movies/shows"
      expect(response).to have_http_status(:success)
    end
  end

end
