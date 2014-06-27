require 'rails_helper'

describe EventsController do
  describe "GET /new" do
    context "when user is not logged in" do
      before do
        get :new
      end

      it "should redirect to /" do
        expect(response).to redirect_to root_path
      end
    end

    context "when user is logged in" do
      before do
        user = create(:user)
        session[:user_id] = user.id
        get :new
      end

      it "should return 200" do
        expect(response).to be_ok
      end

      it "should create a new Event" do
        expect(assigns(:event)).to be_a_new Event
      end

      it "should render new template" do
        expect(response).to render_template :new
      end
    end
  end
end
