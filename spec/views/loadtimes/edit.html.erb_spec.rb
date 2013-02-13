require 'spec_helper'

describe "loadtimes/edit.html.erb" do
  before(:each) do
    @loadtime = assign(:loadtime, stub_model(Loadtime,
      :loadtime => 1.5,
      :page => "MyString",
      :date => "MyString"
    ))
  end

  it "renders the edit loadtime form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => loadtimes_path(@loadtime), :method => "post" do
      assert_select "input#loadtime_loadtime", :name => "loadtime[loadtime]"
      assert_select "input#loadtime_page", :name => "loadtime[page]"
      assert_select "input#loadtime_date", :name => "loadtime[date]"
    end
  end
end
