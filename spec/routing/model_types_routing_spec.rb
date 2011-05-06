require "spec_helper"

describe ModelTypesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/model_types" }.should route_to(:controller => "model_types", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/model_types/new" }.should route_to(:controller => "model_types", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/model_types/1" }.should route_to(:controller => "model_types", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/model_types/1/edit" }.should route_to(:controller => "model_types", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/model_types" }.should route_to(:controller => "model_types", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/model_types/1" }.should route_to(:controller => "model_types", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/model_types/1" }.should route_to(:controller => "model_types", :action => "destroy", :id => "1")
    end

  end
end
