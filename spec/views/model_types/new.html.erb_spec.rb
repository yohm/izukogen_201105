require 'spec_helper'

describe "model_types/new.html.erb" do
  before(:each) do
    assign(:model_type, stub_model(ModelType,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new model_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => model_types_path, :method => "post" do
      assert_select "input#model_type_name", :name => "model_type[name]"
      assert_select "textarea#model_type_description", :name => "model_type[description]"
    end
  end
end
