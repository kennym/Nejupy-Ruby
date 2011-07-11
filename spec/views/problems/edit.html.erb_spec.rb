require 'spec_helper'

describe "problems/edit.html.erb" do
  before(:each) do
    @problem = assign(:problem, stub_model(Problem))
  end

  it "renders the edit problem form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => problems_path(@problem), :method => "post" do
    end
  end
end
