require 'spec_helper'

describe ComponentResult do

  before(:each) do
    @comp = Component.create!(:name => "test_component")
    @attr = {:start_at => DateTime.new,
      :finish_at => nil,
      :component_id => 1,
      :module_folder => "/foo/bar/module",
      :env => "",
      :parameter => "testparameter=1",
      :status => "waiting",
      :folder => "/foo/bar/output",
      :result_file => "{top => /foo/bar/top.prt, log => /foo/bar/out.log}",
      :previous_component_result_id => 3,
      :scenario_id => 2
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
    cr2 = ComponentResult.new(@attr.merge(:folder => '/another/folder') )
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

  it "should fail without component_id" do
    cr = ComponentResult.new(@attr.merge(:component_id => nil) )
    cr.should_not be_valid
  end

  it "should fail without previous_component_result_id" do
    cr = ComponentResult.new(@attr.merge(:previous_component_result_id => nil) )
    cr.should_not be_valid
  end

  it "should fail without folder" do
    cr = ComponentResult.new(@attr.merge(:folder => nil) )
    cr.should_not be_valid
  end

  it "should without unique folder" do
    attr = @attr.merge(:folder => '/duplicated')
    ComponentResult.create!(attr)
    cr = ComponentResult.new(attr)
    cr.should_not be_valid
  end
end
