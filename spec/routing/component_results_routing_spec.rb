require "spec_helper"

describe ComponentResultsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/component_results" }.should route_to(:controller => "component_results", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/component_results/new" }.should route_to(:controller => "component_results", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/component_results/1" }.should route_to(:controller => "component_results", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/component_results/1/edit" }.should route_to(:controller => "component_results", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/component_results" }.should route_to(:controller => "component_results", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/component_results/1" }.should route_to(:controller => "component_results", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/component_results/1" }.should route_to(:controller => "component_results", :action => "destroy", :id => "1")
    end

  end
end
