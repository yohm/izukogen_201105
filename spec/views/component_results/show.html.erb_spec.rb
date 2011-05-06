require 'spec_helper'

describe "component_results/show.html.erb" do
  before(:each) do
    @component_result = assign(:component_result, stub_model(ComponentResult,
      :component_id => 1,
      :module_folder => "Module Folder",
      :env => "MyText",
      :parameter => "MyText",
      :status => "Status",
      :folder => "Folder",
      :result_file => "Result File",
      :previous_component_result_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Module Folder/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Status/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Folder/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Result File/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
