require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:company) { Fabricate(:company) }

  it "converts to a string of company name" do
    expect(company.to_s).to eq("Apple")
  end

  describe ".create" do
    it "is valid" do
      expect(company).to be_valid
    end

    it "is invalid without a name" do
      company.name = nil

      expect(company).to be_invalid
    end
  end

  describe "#phone_numbers" do
    it "responds with its phone numbers after they're created" do
      phone_number = company.phone_numbers.build(number: "333-4444")
      expect(company.phone_numbers.map(&:number)).to eq(["333-4444"])
    end
  end

  describe "#email_addresses" do
    it "responds with its email addresses after they're created" do
      email_address = company.email_addresses.build(address: "molsen@example.com")
      expect(company.email_addresses.map(&:address)).to eq(["molsen@example.com"])
    end
  end

end
