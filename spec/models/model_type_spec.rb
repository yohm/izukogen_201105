require 'spec_helper'

describe ModelType do

  before(:each) do
    @attr = { :name => 'example_name', :description => 'example description' }
  end
  
  it "should create a new instance given valid attributes" do
    ModelType.create!(@attr)
  end

  it "should require a name" do
    noname_type = ModelType.new( @attr.merge(:name => "") )
    noname_type.should_not be_valid
  end

  it "should reject names that are too long" do
    longname_type = ModelType.new( @attr.merge(:name => 'a'*51) )
    longname_type.should_not be_valid
  end

  it "should reject duplicate name" do
    ModelType.create!( @attr )
    another_type_with_same_name = ModelType.new( @attr )
    another_type_with_same_name.should_not be_valid
  end

  it "should reject name identical up to case" do
    ModelType.create!( @attr )
    upcased_name = @attr[:name].upcase
    another_type_with_upcased_name = ModelType.new( @attr.merge(:name => upcased_name) )
    another_type_with_upcased_name.should_not be_valid
  end

end
