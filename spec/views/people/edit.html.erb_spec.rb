require 'rails_helper'

RSpec.describe "people/edit", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
      :first_name => "MyText",
      :last_name => "MyText"
    ))
  end

  it "renders the edit person form" do
    render

    assert_select "form[action=?][method=?]", person_path(@person), "post" do

      assert_select "textarea#person_first_name[name=?]", "person[first_name]"

      assert_select "textarea#person_last_name[name=?]", "person[last_name]"
    end
  end
end
