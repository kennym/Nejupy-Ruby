require 'spec_helper'

describe "solutions/index.html.erb" do
  before(:each) do
    assign(:solutions, [
      stub_model(Solution),
      stub_model(Solution)
    ])
  end

  it "renders a list of solutions" do
    render
  end
end
