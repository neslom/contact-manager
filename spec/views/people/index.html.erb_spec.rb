require 'rails_helper'

RSpec.describe "people/index", type: :view do
  before(:each) do
    assign(:people, [
      Person.create!(
        :first_name => "MyText",
        :last_name => "MyText"
      ),
      Person.create!(
        :first_name => "SecondEntry",
        :last_name => "SecondEntry"
      )
    ])
  end

  it "renders a list of people" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "SecondEntry".to_s, :count => 2
  end
end
