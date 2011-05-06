require 'spec_helper'

describe "component_results/index.html.erb" do
  before(:each) do
    assign(:component_results, [
      stub_model(ComponentResult,
        :component_id => 1,
        :module_folder => "Module Folder",
        :env => "MyText",
        :parameter => "MyText",
        :status => "Status",
        :folder => "Folder",
        :result_file => "Result File",
        :previous_component_result_id => 1
      ),
      stub_model(ComponentResult,
        :component_id => 1,
        :module_folder => "Module Folder",
        :env => "MyText",
        :parameter => "MyText",
        :status => "Status",
        :folder => "Folder",
        :result_file => "Result File",
        :previous_component_result_id => 1
      )
    ])
  end

  it "renders a list of component_results" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Module Folder".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Folder".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Result File".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
