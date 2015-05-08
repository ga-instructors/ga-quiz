require "rails_helper"

RSpec.describe Groups::RegroupsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/groups/regroups").to route_to("groups/regroups#index")
    end

    it "routes to #new" do
      expect(:get => "/groups/regroups/new").to route_to("groups/regroups#new")
    end

    it "routes to #show" do
      expect(:get => "/groups/regroups/1").to route_to("groups/regroups#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/groups/regroups/1/edit").to route_to("groups/regroups#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/groups/regroups").to route_to("groups/regroups#create")
    end

    it "routes to #update" do
      expect(:put => "/groups/regroups/1").to route_to("groups/regroups#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/groups/regroups/1").to route_to("groups/regroups#destroy", :id => "1")
    end

  end
end
