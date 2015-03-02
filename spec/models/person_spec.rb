require 'rails_helper'

RSpec.describe Person, type: :model do
  let(:person) { Fabricate(:person) }

  it "converts to a string with last name, first name" do
    expect(person.to_s).to eq("Smith, Alice")
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
    it "responds with its created phone numbers" do
      person.phone_numbers.build(number: '555-8888')

      expect(person.phone_numbers.map(&:number)).to eq(['555-8888'])
    end
  end

  describe "#email_addresses" do
    it "responds with its created email addresses" do
      person.email_addresses.build(address: 'molsen@example.com')

      expect(person.email_addresses.map(&:address)).to eq(['molsen@example.com'])
    end
  end

  it "is a child of the user" do
    expect(person.user).to be_instance_of(User)
  end
end
