require "rails_helper"

RSpec.describe Quizzes::QuizzesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/quizzes/quizzes").to route_to("quizzes/quizzes#index")
    end

    it "routes to #new" do
      expect(:get => "/quizzes/quizzes/new").to route_to("quizzes/quizzes#new")
    end

    it "routes to #show" do
      expect(:get => "/quizzes/quizzes/1").to route_to("quizzes/quizzes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/quizzes/quizzes/1/edit").to route_to("quizzes/quizzes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/quizzes/quizzes").to route_to("quizzes/quizzes#create")
    end

    it "routes to #update" do
      expect(:put => "/quizzes/quizzes/1").to route_to("quizzes/quizzes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/quizzes/quizzes/1").to route_to("quizzes/quizzes#destroy", :id => "1")
    end

  end
end
