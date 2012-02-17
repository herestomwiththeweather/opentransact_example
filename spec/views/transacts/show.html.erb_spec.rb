require 'spec_helper'

describe "transacts/show" do
  before(:each) do
    @transact = assign(:transact, stub_model(Transact,
      :to => "To",
      :amount => "9.99",
      :note => "Note"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/To/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Note/)
  end
end
