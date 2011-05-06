require 'spec_helper'

describe "components/index.html.erb" do
  before(:each) do
    assign(:components, [
      stub_model(Component,
        :name => "Name",
        :class_name => "Class Name",
        :product_name => "Product Name",
        :input_type_id => 1,
        :output_type_id => 1,
        :canvas_component => "Canvas Component",
        :description => "MyText"
      ),
      stub_model(Component,
        :name => "Name",
        :class_name => "Class Name",
        :product_name => "Product Name",
        :input_type_id => 1,
        :output_type_id => 1,
        :canvas_component => "Canvas Component",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of components" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Class Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Product Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Canvas Component".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
