require 'spec_helper'

describe "problems/index.html.erb" do
  before(:each) do
    assign(:problems, [
      stub_model(Problem),
      stub_model(Problem)
    ])
  end

  it "renders a list of problems" do
    render
  end
end
