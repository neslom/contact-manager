require 'rails_helper'

RSpec.describe Person, type: :model do
  describe ".create" do
    it "is invalid without a first name" do
      person = Person.create(last_name: "Smith")

      expect(person).to be_invalid
    end

    it "is invalid without a last name" do
      person = Person.create(first_name: "Bob")

      expect(person).not_to be_valid
    end
  end
end
