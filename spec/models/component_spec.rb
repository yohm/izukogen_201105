require 'spec_helper'

describe Component do

  before(:each) do
    @attr = {
      :name => "test_name",
      :class_name => "writer",
      :product_name => "170001",
      :canvas_component => "test_c_name",
      :description => "test description ..."
    }
  end

  it "should success in creation" do
    comp = Component.new(@attr)
    comp.should be_valid
  end

  it "should have an accessor 'input_type' and 'output_type'" do
    type1 = ModelType.new( :name => "type1")
    type1.save!
    type2 = ModelType.new( :name => "type2")
    type2.save!
    comp = Component.new(@attr)
    comp.input_type = type1
    comp.output_type = type2
    comp.save!
    id = comp.id
    Component.find(id).input_type.name.should == "type1"
    Component.find(id).output_type.name.should == "type2"
  end

  it "should be invalid without name" do
    comp = Component.new(@attr.merge(:name => ''))
    comp.should_not be_valid
  end

  it "should have a unique name" do
    Component.create!(@attr.merge(:name => 'duplicate'))
    comp = Component.new(@attr.merge(:name => 'duplicate'))
    comp.should_not be_valid
  end

  it "should be invalid without class_name" do
    comp = Component.new(@attr.merge(:name => 'wihtout_class', :class_name => ''))
    comp.should_not be_valid
  end

  it "should be invalid without product_name" do
    comp = Component.new(@attr.merge(:name => 'wihtout_product_name', :class_name => ''))
    comp.should_not be_valid
  end

end
