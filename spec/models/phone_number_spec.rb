require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  let(:phone_number) { PhoneNumber.new(number: "1112223333", person_id: 1) }

  describe ".create" do
    it "is valid" do
      expect(phone_number).to be_valid
    end

    it "cannot be blank" do
      phone_number.number = nil

      expect(phone_number).to be_invalid
    end

    it "must have a referrence to a person" do
      phone_number.person_id = nil

      expect(phone_number).to be_invalid
    end

  end

  it "is associated with a person" do
    expect(phone_number).to respond_to(:person)
  end
end
