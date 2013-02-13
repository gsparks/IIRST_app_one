require 'spec_helper'

describe "loadtimes/show.html.erb" do
  before(:each) do
    @loadtime = assign(:loadtime, stub_model(Loadtime,
      :loadtime => 1.5,
      :page => "Page",
      :date => "Date"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Page/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Date/)
  end
end
