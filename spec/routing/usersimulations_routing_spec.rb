require "spec_helper"

describe UsersimulationsController do
  describe "routing" do

    it "routes to #index" do
      get("/usersimulations").should route_to("usersimulations#index")
    end

    it "routes to #new" do
      get("/usersimulations/new").should route_to("usersimulations#new")
    end

    it "routes to #show" do
      get("/usersimulations/1").should route_to("usersimulations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/usersimulations/1/edit").should route_to("usersimulations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/usersimulations").should route_to("usersimulations#create")
    end

    it "routes to #update" do
      put("/usersimulations/1").should route_to("usersimulations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/usersimulations/1").should route_to("usersimulations#destroy", :id => "1")
    end

  end
end
