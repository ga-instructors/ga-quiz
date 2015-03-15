require "rails_helper"

RSpec.describe Quizzes::AnswersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/quizzes/answers").to route_to("quizzes/answers#index")
    end

    it "routes to #new" do
      expect(:get => "/quizzes/answers/new").to route_to("quizzes/answers#new")
    end

    it "routes to #show" do
      expect(:get => "/quizzes/answers/1").to route_to("quizzes/answers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/quizzes/answers/1/edit").to route_to("quizzes/answers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/quizzes/answers").to route_to("quizzes/answers#create")
    end

    it "routes to #update" do
      expect(:put => "/quizzes/answers/1").to route_to("quizzes/answers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/quizzes/answers/1").to route_to("quizzes/answers#destroy", :id => "1")
    end

  end
end
