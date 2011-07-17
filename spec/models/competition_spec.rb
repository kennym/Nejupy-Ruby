require 'spec_helper'

describe Competition do
  context "when is created" do
    #it "its status is in 'Not started'" do
    #  competition = Competition.create!(:name => "Test")
    #  competition.status.should == 1
    #end
  end

  context "when it starts" do
    before { @competition = Factory.create(:competition) }
    
    it "the start time should be set" do
      @competition.start_time.should be_nil
      
      @competition.start
      
      @competition.start_time.should_not be_nil
    end

    it "the status should be set to 'In Progress'" do
      @competition.start
      @competition.status.should == 2
    end

    it "and gets started again, start_time should not change" do
      @competition.start
      original_time = @competition.start_time

      @competition.start
      @competition.start_time.should == original_time
    end
  end

  context "when it ends" do
    before { @competition = Factory.create(:competition) }

    it "the end time should be set" do
      @competition.end_time.should be_nil

      @competition.start
      @competition.end

      @competition.end_time.should_not be_nil
    end

    it "the status should be set to 'Finished'" do
      @competition.start
      @competition.end

      @competition.status.should == 3
    end
    
    it "and gets started again, start_time should not change" do
      @competition.start
      @competition.end
      original_time = @competition.end_time

      @competition.end
      @competition.end_time.should == original_time
    end
  end
end
