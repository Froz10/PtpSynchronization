require "rails_helper"

RSpec.describe HomeController, type: :controller do
  let!(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "#index" do
    it "succeeds" do
      get :index
      expect(response).to be_successful
    end
  end
end