require 'spec_helper'

describe "scenarios/new.html.erb" do
  before(:each) do
    assign(:scenario, stub_model(Scenario,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new scenario form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => scenarios_path, :method => "post" do
      assert_select "input#scenario_name", :name => "scenario[name]"
      assert_select "textarea#scenario_description", :name => "scenario[description]"
    end
  end
end
