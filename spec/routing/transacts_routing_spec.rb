require "spec_helper"

describe TransactsController do
  describe "routing" do

    it "routes to #index" do
      get("/transacts").should route_to("transacts#index")
    end

    it "routes to #new" do
      get("/transacts/new").should route_to("transacts#new")
    end

    it "routes to #show" do
      get("/transacts/1").should route_to("transacts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/transacts/1/edit").should route_to("transacts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/transacts").should route_to("transacts#create")
    end

    it "routes to #update" do
      put("/transacts/1").should route_to("transacts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/transacts/1").should route_to("transacts#destroy", :id => "1")
    end

  end
end
