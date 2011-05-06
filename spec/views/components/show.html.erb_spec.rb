require 'spec_helper'

describe "components/show.html.erb" do
  before(:each) do
    @component = assign(:component, stub_model(Component,
      :name => "Name",
      :class_name => "Class Name",
      :product_name => "Product Name",
      :input_type_id => 1,
      :output_type_id => 1,
      :canvas_component => "Canvas Component",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Class Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Product Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Canvas Component/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
