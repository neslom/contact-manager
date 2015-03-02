require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { Fabricate(:user) }

  it "has associated people" do
    expect(user.people).to eq([])
  end
end
