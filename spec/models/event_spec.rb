require 'rails_helper'

describe Event do
  describe "#name" do
    context "when empty is given" do
      let(:event) do
        Event.new(name: "")
      end

      it "should not be valid" do
        event.valid?
        expect(event.errors[:name]).to be_present
      end
    end
  end
end
