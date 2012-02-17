require 'spec_helper'

describe "transacts/index" do
  before(:each) do
    assign(:transacts, [
      stub_model(Transact,
        :to => "To",
        :amount => "9.99",
        :note => "Note"
      ),
      stub_model(Transact,
        :to => "To",
        :amount => "9.99",
        :note => "Note"
      )
    ])
  end

  it "renders a list of transacts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "To".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Note".to_s, :count => 2
  end
end
