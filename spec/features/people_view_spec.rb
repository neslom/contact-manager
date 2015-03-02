require 'rails_helper'

describe "the people view", type: :feature do
  context "when logged in" do
    let(:user) { Fabricate(:user) }

    it "displays people associated with the user" do
      person_1 = Fabricate(:person)
      person_1.user = user
      person_1.save

      login_as(user)

      visit(people_path)

      printed_name = "#{person_1.first_name} #{person_1.last_name}"
      expect(page).to have_content(printed_name)
    end

    it "does not display people associated with an other user" do
      user_2 = Fabricate(:user)
      person_2 = Fabricate(:person)
      person_2.user = user_2
      person_2.save

      login_as(user)
      visit(people_path)

      printed_name = "#{person_2.first_name} #{person_2.last_name}"
      expect(page).not_to have_content(printed_name)
    end
  end
end

