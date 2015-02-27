require 'rails_helper'

RSpec.describe Person, type: :model do
  describe ".create" do

    context "without first name" do

      it "is invalid" do
        person = Person.create(first_name: nil)

        expect(person).not_to be_valid
      end

    end

  end

end
