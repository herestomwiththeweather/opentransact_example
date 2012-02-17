require 'spec_helper'

describe "transacts/edit" do
  before(:each) do
    @transact = assign(:transact, stub_model(Transact,
      :to => "MyString",
      :amount => "9.99",
      :note => "MyString"
    ))
  end

  it "renders the edit transact form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => transacts_path(@transact), :method => "post" do
      assert_select "input#transact_to", :name => "transact[to]"
      assert_select "input#transact_amount", :name => "transact[amount]"
      assert_select "input#transact_note", :name => "transact[note]"
    end
  end
end
