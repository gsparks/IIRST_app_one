require 'spec_helper'

describe "networks/show.html.erb" do
  before(:each) do
    @network = assign(:network, stub_model(Network,
      :latency => 1,
      :jitter => "Jitter",
      :date => "Date"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Jitter/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Date/)
  end
end
