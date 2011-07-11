require 'spec_helper'

describe "problems/new.html.erb" do
  before(:each) do
    assign(:problem, stub_model(Problem).as_new_record)
  end

  it "renders new problem form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => problems_path, :method => "post" do
    end
  end
end
