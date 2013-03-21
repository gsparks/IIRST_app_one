require 'spec_helper'

describe "usersimulations/index.html.erb" do
  before(:each) do
    assign(:usersimulations, [
      stub_model(Usersimulation,
        :status => "Status",
        :interval => 1,
        :numsims => 1
      ),
      stub_model(Usersimulation,
        :status => "Status",
        :interval => 1,
        :numsims => 1
      )
    ])
  end

  it "renders a list of usersimulations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
