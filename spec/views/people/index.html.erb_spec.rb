require 'spec_helper'

describe "people/index" do
  before(:each) do
    assign(:people, [
      stub_model(Person,
        :username => "Username",
        :email => "Email",
        :password => "Password"
      ),
      stub_model(Person,
        :username => "Username",
        :email => "Email",
        :password => "Password"
      )
    ])
  end

  it "renders a list of people" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Password".to_s, :count => 2
  end
end
