require 'spec_helper'

describe "solutions/edit.html.erb" do
  before(:each) do
    @solution = assign(:solution, stub_model(Solution))
  end

  it "renders the edit solution form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => solutions_path(@solution), :method => "post" do
    end
  end
end
