require 'rails_helper'

describe "the person view", type: :feature do
  let(:person) { Person.create(first_name: "Bill", last_name: "Clinton") }

  before(:each) do
    person.phone_numbers.create(number: "867-5309")
    person.phone_numbers.create(number: "555-1234")

    visit person_path(person)
  end

  it "shows the phone numbers" do
    person.phone_numbers.each do |phone|
      expect(page).to have_content(phone.number)
    end
  end

  it "has a link to add a new phone number" do
    expect(page).to have_link('Add phone number', href: new_phone_number_path(person_id: person.id))
  end

  it "adds a new phone number" do
    page.click_link_or_button('Add phone number')

    expect(current_path).to eq(new_phone_number_path)

    page.fill_in('Number', with: '123-4567')
    page.click_link_or_button('Create Phone number')

    expect(current_path).to eq(person_path(person))
    expect(page).to have_content('123-4567')
  end
end
