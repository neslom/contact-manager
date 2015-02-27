require 'rails_helper'

RSpec.describe "people/new", type: :view do
  before(:each) do
    assign(:person, Person.new(
      :first_name => "MyText",
      :last_name => "MyText"
    ))
  end

  it "renders new person form" do
    render

    assert_select "form[action=?][method=?]", people_path, "post" do

      assert_select "textarea#person_first_name[name=?]", "person[first_name]"

      assert_select "textarea#person_last_name[name=?]", "person[last_name]"
    end
  end
end
