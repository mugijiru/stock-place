require "rails_helper"

RSpec.describe StocksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/stocks").to route_to("stocks#index")
    end

    it "routes to #new" do
      expect(:get => "/stocks/new").to route_to("stocks#new")
    end

    it "routes to #create" do
      expect(:post => "/stocks").to route_to("stocks#create")
    end

    it "routes to #destroy" do
      expect(:delete => "/stocks/1").to route_to("stocks#destroy", :id => "1")
    end
  end
end
