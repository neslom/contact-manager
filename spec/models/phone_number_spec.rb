require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  let(:person) { Person.create(first_name: "Billy", last_name: "Bob") }

  let(:phone_number) do
    PhoneNumber.create(number: "111-222-3333", contact_id: person.id, contact_type: "Person")
  end

  describe ".create" do
    it "is valid" do
      expect(phone_number).to be_valid
    end

    it "cannot be blank" do
      phone_number.number = nil

      expect(phone_number).to be_invalid
    end

    it "must have a referrence to a contact" do
      phone_number.contact_id = nil

      expect(phone_number).to be_invalid
    end

  end

  it "is associated with a contact" do
    expect(phone_number).to respond_to(:contact)
  end
end
