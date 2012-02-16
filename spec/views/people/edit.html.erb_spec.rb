require 'spec_helper'

describe "people/edit" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      :username => "MyString",
      :email => "MyString",
      :password => "MyString"
    ))
  end

  it "renders the edit person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => people_path(@person), :method => "post" do
      assert_select "input#person_username", :name => "person[username]"
      assert_select "input#person_email", :name => "person[email]"
      assert_select "input#person_password", :name => "person[password]"
    end
  end
end
