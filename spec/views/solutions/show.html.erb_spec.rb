require 'spec_helper'

describe "solutions/show.html.erb" do
  before(:each) do
    @solution = assign(:solution, stub_model(Solution))
  end

  it "renders attributes in <p>" do
    render
  end
end
