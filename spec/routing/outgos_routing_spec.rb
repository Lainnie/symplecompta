require "rails_helper"

RSpec.describe OutgosController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/outgos").to route_to("outgos#index")
    end

    it "routes to #new" do
      expect(:get => "/outgos/new").to route_to("outgos#new")
    end

    it "routes to #show" do
      expect(:get => "/outgos/1").to route_to("outgos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/outgos/1/edit").to route_to("outgos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/outgos").to route_to("outgos#create")
    end

    it "routes to #update" do
      expect(:put => "/outgos/1").to route_to("outgos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/outgos/1").to route_to("outgos#destroy", :id => "1")
    end

  end
end
