require 'rails_helper'

RSpec.describe GamificationController, type: :controller do

  describe "GET #achievements" do
    it "returns http success" do
      get :achievements
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #ranks" do
    it "returns http success" do
      get :ranks
      expect(response).to have_http_status(:success)
    end
  end

end
