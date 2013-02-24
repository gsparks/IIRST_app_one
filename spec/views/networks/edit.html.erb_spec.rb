require 'spec_helper'

describe "networks/edit.html.erb" do
  before(:each) do
    @network = assign(:network, stub_model(Network,
      :latency => 1,
      :jitter => "MyString",
      :date => "MyString"
    ))
  end

  it "renders the edit network form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => networks_path(@network), :method => "post" do
      assert_select "input#network_latency", :name => "network[latency]"
      assert_select "input#network_jitter", :name => "network[jitter]"
      assert_select "input#network_date", :name => "network[date]"
    end
  end
end
