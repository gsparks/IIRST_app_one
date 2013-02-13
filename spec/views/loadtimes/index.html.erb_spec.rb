require 'spec_helper'

describe "loadtimes/index.html.erb" do
  before(:each) do
    assign(:loadtimes, [
      stub_model(Loadtime,
        :loadtime => 1.5,
        :page => "Page",
        :date => "Date"
      ),
      stub_model(Loadtime,
        :loadtime => 1.5,
        :page => "Page",
        :date => "Date"
      )
    ])
  end

  it "renders a list of loadtimes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Page".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Date".to_s, :count => 2
  end
end
