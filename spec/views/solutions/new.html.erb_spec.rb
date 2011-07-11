require 'spec_helper'

describe "solutions/new.html.erb" do
  before(:each) do
    assign(:solution, stub_model(Solution).as_new_record)
  end

  it "renders new solution form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => solutions_path, :method => "post" do
    end
  end
end
