require 'spec_helper'

describe "problems/show.html.erb" do
  before(:each) do
    @problem = assign(:problem, stub_model(Problem))
  end

  it "renders attributes in <p>" do
    render
  end
end
