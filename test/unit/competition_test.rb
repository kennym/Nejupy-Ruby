require 'test_helper'

class CompetitionTest < ActiveSupport::TestCase
  test "create competition" do
    Competition.create!(:name => "Test",
                        :description => "Test competition")

    assert Competition.find_by_name("Test")
  end
  
  test "should not save competition without name" do
    record = Competition.new(:description => "Test competition")

    assert !record.valid?
  end

  test "can save competition without description" do
    Competition.create(:name => "Test2")

    assert Competition.find_by_name("Test2")
  end

  test "should not save competition without name and description" do
    record = Competition.new()

    assert !record.valid?
  end
end
