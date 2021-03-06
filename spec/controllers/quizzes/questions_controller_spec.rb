require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe Quizzes::QuestionsController, type: :controller do

  before :each do
    @group, @user = create(:group), create(:user)
    @membership = @group.group_members.create(role: 'instructor', user: @user)
    @session = @user.sessions.create!(password: @user.password)
    @quiz = create(:quiz, group: @group)
  end

  # This should return the minimal set of attributes required to create a valid
  # Quizzes::Question. As you add validations to Quizzes::Question, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Quizzes::QuestionsController. Be sure to keep this updated too.
  let(:valid_session) { { :id => @session.id } }

  describe "GET #index" do
    it "assigns all quizzes_questions as @quizzes_questions" do
      question = Quizzes::Question.create! valid_attributes
      get :index, { :quiz_id => @quiz.id }, valid_session
      expect(assigns(:quizzes_questions)).to eq([question])
    end
  end

  describe "GET #show" do
    it "assigns the requested quizzes_question as @quizzes_question" do
      question = Quizzes::Question.create! valid_attributes
      get :show, {:id => question.to_param}, valid_session
      expect(assigns(:quizzes_question)).to eq(question)
    end
  end

  describe "GET #new" do
    it "assigns a new quizzes_question as @quizzes_question" do
      get :new, { :quiz_id => @quiz.id }, valid_session
      expect(assigns(:quizzes_question)).to be_a_new(Quizzes::Question)
    end
  end

  describe "GET #edit" do
    it "assigns the requested quizzes_question as @quizzes_question" do
      question = Quizzes::Question.create! valid_attributes
      get :edit, {:id => question.to_param}, valid_session
      expect(assigns(:quizzes_question)).to eq(question)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Quizzes::Question" do
        expect {
          post :create, {:quizzes_question => valid_attributes}, valid_session
        }.to change(Quizzes::Question, :count).by(1)
      end

      it "assigns a newly created quizzes_question as @quizzes_question" do
        post :create, {:quizzes_question => valid_attributes}, valid_session
        expect(assigns(:quizzes_question)).to be_a(Quizzes::Question)
        expect(assigns(:quizzes_question)).to be_persisted
      end

      it "redirects to the created quizzes_question" do
        post :create, {:quizzes_question => valid_attributes}, valid_session
        expect(response).to redirect_to(Quizzes::Question.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved quizzes_question as @quizzes_question" do
        post :create, {:quizzes_question => invalid_attributes}, valid_session
        expect(assigns(:quizzes_question)).to be_a_new(Quizzes::Question)
      end

      it "re-renders the 'new' template" do
        post :create, {:quizzes_question => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested quizzes_question" do
        question = Quizzes::Question.create! valid_attributes
        put :update, {:id => question.to_param, :quizzes_question => new_attributes}, valid_session
        question.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested quizzes_question as @quizzes_question" do
        question = Quizzes::Question.create! valid_attributes
        put :update, {:id => question.to_param, :quizzes_question => valid_attributes}, valid_session
        expect(assigns(:quizzes_question)).to eq(question)
      end

      it "redirects to the quizzes_question" do
        question = Quizzes::Question.create! valid_attributes
        put :update, {:id => question.to_param, :quizzes_question => valid_attributes}, valid_session
        expect(response).to redirect_to(question)
      end
    end

    context "with invalid params" do
      it "assigns the quizzes_question as @quizzes_question" do
        question = Quizzes::Question.create! valid_attributes
        put :update, {:id => question.to_param, :quizzes_question => invalid_attributes}, valid_session
        expect(assigns(:quizzes_question)).to eq(question)
      end

      it "re-renders the 'edit' template" do
        question = Quizzes::Question.create! valid_attributes
        put :update, {:id => question.to_param, :quizzes_question => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested quizzes_question" do
      question = Quizzes::Question.create! valid_attributes
      expect {
        delete :destroy, {:id => question.to_param}, valid_session
      }.to change(Quizzes::Question, :count).by(-1)
    end

    it "redirects to the quizzes_questions list" do
      question = Quizzes::Question.create! valid_attributes
      delete :destroy, {:id => question.to_param}, valid_session
      expect(response).to redirect_to(quizzes_questions_url)
    end
  end

end
