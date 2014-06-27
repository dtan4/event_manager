require 'rails_helper'

describe "events/show" do
  context "when user is not logged in" do
    before do
      allow(view).to receive(:logged_in?).and_return(false)
      allow(view).to receive(:current_user).and_return(nil)
    end

    context "and @event.owner is nil" do
      before do
        assign(:event, create(:event, owner: nil))
        assign(:tickets, [])
      end

      it "should show '退会したユーザです'" do
        render
        expect(rendered).to match /退会したユーザです/
      end
    end
  end
end
