require "rails_helper"

RSpec.describe Cities::WeathersController, type: :routing do
  describe "routing" do
    it "not routes to #index" do
      expect(:get => "/cities/1/weathers").to_not route_to("cities/weathers#index")
    end

    it "routes to #new" do
      expect(:get => "/cities/1/weathers/new").to route_to("cities/weathers#new", :city_id => "1")
    end

    it "not routes to #show" do
      expect(:get => "/cities/1/weathers/1").to_not route_to("cities/weathers#show", :id => "1", :city_id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/cities/1/weathers/1/edit").to route_to("cities/weathers#edit", :id => "1", :city_id => "1")
    end


    it "routes to #create" do
      expect(:post => "/cities/1/weathers").to route_to("cities/weathers#create", :city_id => "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "/cities/1/weathers/1").to route_to("cities/weathers#update", :id => "1", :city_id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/cities/1/weathers/1").to route_to("cities/weathers#update", :id => "1", :city_id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/cities/1/weathers/1").to route_to("cities/weathers#destroy", :id => "1", :city_id => "1")
    end
  end
end
