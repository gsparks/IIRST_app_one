require 'spec_helper'

describe "usersimulations/show.html.erb" do
  before(:each) do
    @usersimulation = assign(:usersimulation, stub_model(Usersimulation,
      :status => "Status",
      :interval => 1,
      :numsims => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Status/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
