require "spec_helper"

describe LoadtimesController do
  describe "routing" do

    it "routes to #index" do
      get("/loadtimes").should route_to("loadtimes#index")
    end

    it "routes to #new" do
      get("/loadtimes/new").should route_to("loadtimes#new")
    end

    it "routes to #show" do
      get("/loadtimes/1").should route_to("loadtimes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/loadtimes/1/edit").should route_to("loadtimes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/loadtimes").should route_to("loadtimes#create")
    end

    it "routes to #update" do
      put("/loadtimes/1").should route_to("loadtimes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/loadtimes/1").should route_to("loadtimes#destroy", :id => "1")
    end

  end
end
