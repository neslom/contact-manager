require 'rails_helper'

RSpec.describe Person, type: :model do
  let(:person) do
      Person.new(first_name: 'Alice', last_name: 'Smith')
    end

  describe ".create" do
    it "is valid" do
      expect(person).to be_valid
    end

    it "is invalid without a first name" do
      person.first_name = nil

      expect(person).to be_invalid
    end

    it "is invalid without a last name" do
      person.last_name = nil

      expect(person).not_to be_valid
    end
  end

  describe "#phone_numbers" do
    it "returns an array of phone numbers" do
      expect(person.phone_numbers).to eq([])
    end
  end

  describe "#email_addresses" do
    it "returns an array of email addresses" do
      expect(person.email_addresses).to eq([])
    end
  end
end
