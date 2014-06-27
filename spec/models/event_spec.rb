require 'rails_helper'

describe Event do
  describe "#name" do
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to ensure_length_of(:name).is_at_most(50) }
  end
end
