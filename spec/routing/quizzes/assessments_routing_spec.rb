require "rails_helper"

RSpec.describe Quizzes::AssessmentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/quizzes/assessments").to route_to("quizzes/assessments#index")
    end

    it "routes to #new" do
      expect(:get => "/quizzes/assessments/new").to route_to("quizzes/assessments#new")
    end

    it "routes to #show" do
      expect(:get => "/quizzes/assessments/1").to route_to("quizzes/assessments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/quizzes/assessments/1/edit").to route_to("quizzes/assessments#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/quizzes/assessments").to route_to("quizzes/assessments#create")
    end

    it "routes to #update" do
      expect(:put => "/quizzes/assessments/1").to route_to("quizzes/assessments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/quizzes/assessments/1").to route_to("quizzes/assessments#destroy", :id => "1")
    end

  end
end
