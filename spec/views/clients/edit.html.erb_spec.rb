require 'spec_helper'

describe "clients/edit" do
  before(:each) do
    @client = assign(:client, stub_model(Client,
      :name => "MyString",
      :website => "MyString",
      :redirect_uri => "MyString",
      :identifier => "MyString",
      :secret => "MyString"
    ))
  end

  it "renders the edit client form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => clients_path(@client), :method => "post" do
      assert_select "input#client_name", :name => "client[name]"
      assert_select "input#client_website", :name => "client[website]"
      assert_select "input#client_redirect_uri", :name => "client[redirect_uri]"
      assert_select "input#client_identifier", :name => "client[identifier]"
      assert_select "input#client_secret", :name => "client[secret]"
    end
  end
end
