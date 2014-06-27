require 'rails_helper'

describe Event do
  describe "#name" do
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to ensure_length_of(:name).is_at_most(50) }
  end

  describe "#created_by?" do
    let(:event) do
      create(:event)
    end

    subject do
      event.created_by?(user)
    end

    context "when nil is given" do
      let(:user) do
        nil
      end

      it "should be false" do
        expect(subject).to be false
      end
    end

    context "when #owner_id and given #id are the same" do
      let(:user) do
        double("user", id: event.id)
      end

      it "should be true" do
        expect(subject).to be true
      end
    end
  end
end
