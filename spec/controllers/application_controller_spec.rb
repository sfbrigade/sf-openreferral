require "rails_helper"

describe ApplicationController do
  controller do
    def index; render nothing: true; end
  end

  describe "when a user is logged in" do
    before(:each) { login_admin }

    it "responds with success if the user is logged in" do
      get :index

      expect(response).to be_success
    end
  end

  describe "when a user is not logged in" do
    it "response with error if the user is not logged in" do
      get :index

      expect(response).to redirect_to("/admins/sign_in")
    end
  end
end