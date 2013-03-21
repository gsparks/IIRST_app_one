require 'spec_helper'

describe "usersimulations/edit.html.erb" do
  before(:each) do
    @usersimulation = assign(:usersimulation, stub_model(Usersimulation,
      :status => "MyString",
      :interval => 1,
      :numsims => 1
    ))
  end

  it "renders the edit usersimulation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => usersimulations_path(@usersimulation), :method => "post" do
      assert_select "input#usersimulation_status", :name => "usersimulation[status]"
      assert_select "input#usersimulation_interval", :name => "usersimulation[interval]"
      assert_select "input#usersimulation_numsims", :name => "usersimulation[numsims]"
    end
  end
end
