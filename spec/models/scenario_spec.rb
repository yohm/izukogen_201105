require 'spec_helper'

describe Scenario do

  before(:each) do
    @attr = { :name => "example name", :description => "example desciption" }
  end

  it "should create a scenario instance given valid attributes" do
    Scenario.create!(@attr)
  end

  describe "component_result associations" do

    before(:each) do
      @attr_cr = {:start_at => DateTime.new,
        :finish_at => nil,
        :module_folder => "/foo/bar/module",
        :component_id => 1,
        :env => "",
        :parameter => "testparameter=1",
        :status => "waiting",
        :folder => "/foo/bar/output",
        :result_file => "{top => /foo/bar/top.prt, log => /foo/bar/out.log}",
        :previous_component_result_id => 2
      }
      
    end

    it "should have a component_results attribute" do
      Scenario.new(@attr).should respond_to( :component_results )
    end
    
    it "should have an access to component_results" do
      scenario = Scenario.create!(@attr)
      scenario.component_results.size.should == 0
      cr1 = ComponentResult.create!( @attr_cr.merge( :parameter => "testparameter=1") )
      scenario.component_results << cr1
      scenario.save!
      crs = Scenario.find(1).component_results
      crs.size.should == 1
      crs[0].parameter.should == "testparameter=1"
    end
  end

  it "should have name" do
    sc = Scenario.new( @attr.merge(:name => '') )
    sc.should_not be_valid
  end

  it "should have unique name" do
    Scenario.create!( @attr.merge(:name => 'duplicate') )
    sc = Scenario.new( @attr.merge(:name => 'duplicate') )
    sc.should_not be_valid
  end
  
end
