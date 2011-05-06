require "spec_helper"

describe ComponentsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/components" }.should route_to(:controller => "components", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/components/new" }.should route_to(:controller => "components", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/components/1" }.should route_to(:controller => "components", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/components/1/edit" }.should route_to(:controller => "components", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/components" }.should route_to(:controller => "components", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/components/1" }.should route_to(:controller => "components", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/components/1" }.should route_to(:controller => "components", :action => "destroy", :id => "1")
    end

  end
end
