require 'spec_helper'

describe "scenarios/edit.html.erb" do
  before(:each) do
    @scenario = assign(:scenario, stub_model(Scenario,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit scenario form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => scenarios_path(@scenario), :method => "post" do
      assert_select "input#scenario_name", :name => "scenario[name]"
      assert_select "textarea#scenario_description", :name => "scenario[description]"
    end
  end
end
