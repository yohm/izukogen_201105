require 'spec_helper'

describe "component_results/new.html.erb" do
  before(:each) do
    assign(:component_result, stub_model(ComponentResult,
      :component_id => 1,
      :module_folder => "MyString",
      :env => "MyText",
      :parameter => "MyText",
      :status => "MyString",
      :folder => "MyString",
      :result_file => "MyString",
      :previous_component_result_id => 1
    ).as_new_record)
  end

  it "renders new component_result form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => component_results_path, :method => "post" do
      assert_select "input#component_result_component_id", :name => "component_result[component_id]"
      assert_select "input#component_result_module_folder", :name => "component_result[module_folder]"
      assert_select "textarea#component_result_env", :name => "component_result[env]"
      assert_select "textarea#component_result_parameter", :name => "component_result[parameter]"
      assert_select "input#component_result_status", :name => "component_result[status]"
      assert_select "input#component_result_folder", :name => "component_result[folder]"
      assert_select "input#component_result_result_file", :name => "component_result[result_file]"
      assert_select "input#component_result_previous_component_result_id", :name => "component_result[previous_component_result_id]"
    end
  end
end
