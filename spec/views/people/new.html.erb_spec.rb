require 'spec_helper'

describe "people/new" do
  before(:each) do
    assign(:person, stub_model(Person,
      :username => "MyString",
      :email => "MyString",
      :password => "MyString"
    ).as_new_record)
  end

  it "renders new person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => people_path, :method => "post" do
      assert_select "input#person_username", :name => "person[username]"
      assert_select "input#person_email", :name => "person[email]"
      assert_select "input#person_password", :name => "person[password]"
    end
  end
end
