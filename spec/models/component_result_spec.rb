require 'spec_helper'

describe ComponentResult do

  before(:each) do
    @comp = Component.create!(:name => "test_component")
    @attr = {:start_at => DateTime.new,
      :finish_at => nil,
      :module_folder => "/foo/bar/module",
      :env => "",
      :parameter => "testparameter=1",
      :status => "waiting",
      :folder => "/foo/bar/output",
      :result_file => "{top => /foo/bar/top.prt, log => /foo/bar/out.log}"
    }
  end

  it "should access component" do
    cr = ComponentResult.new(@attr)
    cr.component = @comp
    cr.save!
    ComponentResult.find(1).component.name.should == @comp.name
  end

  it "shoudl have an accessor to previous_component_result" do
    cr1 = ComponentResult.new(@attr)
    cr1.module_folder = "cr1_module_folder"
    cr1.save!
    cr2 = ComponentResult.new(@attr)
    cr2.previous_component_result = cr1
    cr2.save!
    ComponentResult.find(2).previous_component_result.module_folder.should == "cr1_module_folder"
  end

  it "should have an accessor to scenario" do
    cr = ComponentResult.new(@attr)
    cr.should respond_to(:scenario)
  end

  it "should have the right associated scenario" do
    cr = ComponentResult.new(@attr)
    sc = Scenario.create!( :name => "example_name")
    cr.scenario = sc
    cr.save!
    ComponentResult.find(1).scenario.name.should == "example_name"
  end

  it "should be created by Scenario#component_results method" do
    sc = Scenario.create!( :name => "example_name")
    cr = sc.component_results.create!(@attr)
    cr.scenario.id.should == sc.id
  end
  
end
