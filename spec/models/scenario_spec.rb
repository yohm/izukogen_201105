require 'spec_helper'

describe Scenario do

  before(:each) do
    @attr = { :name => "example name", :description => "example desciption" }
    @attr_cr = {:start_at => DateTime.new,
      :finish_at => nil,
      :module_folder => "/foo/bar/module",
      :env => "",
      :parameter => "testparameter=1",
      :status => "waiting",
      :folder => "/foo/bar/output",
      :result_file => "{top => /foo/bar/top.prt, log => /foo/bar/out.log}"
    }
  end

  it "should create a record" do
    Scenario.create!(@attr)
  end

  it "should have an access to component_results" do
    scenario = Scenario.create!(@attr)
    scenario.component_results.size.should == 0
    cr1 = ComponentResult.create!( @attr_cr.merge( :parameter => "testparameter=1") )
    cr2 = ComponentResult.create!( @attr_cr.merge( :parameter => "testparameter=2") )
    cr3 = ComponentResult.create!( @attr_cr.merge( :parameter => "testparameter=3") )
    scenario.component_results << cr1
    scenario.component_results << cr2
    scenario.component_results << cr3
    scenario.save!
    crs = Scenario.find(1).component_results
    crs.size.should == 3
    crs[0].parameter.should == "testparameter=1"
    crs[1].parameter.should == "testparameter=2"
    crs[2].parameter.should == "testparameter=3"
  end
end
