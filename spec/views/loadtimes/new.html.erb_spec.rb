require 'spec_helper'

describe "loadtimes/new.html.erb" do
  before(:each) do
    assign(:loadtime, stub_model(Loadtime,
      :loadtime => 1.5,
      :page => "MyString",
      :date => "MyString"
    ).as_new_record)
  end

  it "renders new loadtime form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => loadtimes_path, :method => "post" do
      assert_select "input#loadtime_loadtime", :name => "loadtime[loadtime]"
      assert_select "input#loadtime_page", :name => "loadtime[page]"
      assert_select "input#loadtime_date", :name => "loadtime[date]"
    end
  end
end
