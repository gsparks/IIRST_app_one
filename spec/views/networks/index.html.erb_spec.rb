require 'spec_helper'

describe "networks/index.html.erb" do
  before(:each) do
    assign(:networks, [
      stub_model(Network,
        :latency => 1,
        :jitter => "Jitter",
        :date => "Date"
      ),
      stub_model(Network,
        :latency => 1,
        :jitter => "Jitter",
        :date => "Date"
      )
    ])
  end

  it "renders a list of networks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Jitter".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Date".to_s, :count => 2
  end
end
