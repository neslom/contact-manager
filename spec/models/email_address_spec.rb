require 'rails_helper'

RSpec.describe EmailAddress, type: :model do
  let(:company) { Company.create(name: "Twitter") }

  let(:email_address) { EmailAddress.new(address: 'molsen@example.com', contact_id: company.id, contact_type: 'Company') }

  describe ".create" do

    it "is valid" do
      expect(email_address).to be_valid
    end

    it "is invalid without an address" do
      email_address.address = nil
      expect(email_address).to_not be_valid
    end
  end

  it "must have a reference to a contact" do
    email_address.contact_id = nil

    expect(email_address).to be_invalid
  end

  it "is associated with a contact" do
    expect(email_address).to respond_to(:contact)
  end
end
