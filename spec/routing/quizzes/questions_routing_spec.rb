require "rails_helper"

RSpec.describe Quizzes::QuestionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/quizzes/1/questions").to route_to("quizzes/questions#index", :quiz_id => "1")
    end

    it "routes to #new" do
      expect(:get => "/quizzes/questions/new").to route_to("quizzes/questions#new")
    end

    it "routes to #show" do
      expect(:get => "/quizzes/questions/1").to route_to("quizzes/questions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/quizzes/questions/1/edit").to route_to("quizzes/questions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/quizzes/questions").to route_to("quizzes/questions#create")
    end

    it "routes to #update" do
      expect(:put => "/quizzes/questions/1").to route_to("quizzes/questions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/quizzes/questions/1").to route_to("quizzes/questions#destroy", :id => "1")
    end

  end
end
