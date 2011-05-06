require 'spec_helper'

describe "components/edit.html.erb" do
  before(:each) do
    @component = assign(:component, stub_model(Component,
      :name => "MyString",
      :class_name => "MyString",
      :product_name => "MyString",
      :input_type_id => 1,
      :output_type_id => 1,
      :canvas_component => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit component form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => components_path(@component), :method => "post" do
      assert_select "input#component_name", :name => "component[name]"
      assert_select "input#component_class_name", :name => "component[class_name]"
      assert_select "input#component_product_name", :name => "component[product_name]"
      assert_select "input#component_input_type_id", :name => "component[input_type_id]"
      assert_select "input#component_output_type_id", :name => "component[output_type_id]"
      assert_select "input#component_canvas_component", :name => "component[canvas_component]"
      assert_select "textarea#component_description", :name => "component[description]"
    end
  end
end
