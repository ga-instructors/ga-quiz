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

RSpec.describe Quizzes::AssessmentsController, type: :controller do

  before :all do
    @group, @user = create(:group), create(:user)
    @membership = @user.memberships << @group.group_members.new(role: 'student')
    @session = @user.sessions.create!(password: @user.password)
  end

  # This should return the minimal set of attributes required to create a valid
  # Quizzes::Assessment. As you add validations to Quizzes::Assessment, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Quizzes::AssessmentsController. Be sure to keep this updated too.
  let(:valid_session) { { id: @session.id } }

  describe "GET #index" do
    it "assigns all quizzes_assessments as @quizzes_assessments" do
      assessment = Quizzes::Assessment.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:quizzes_assessments)).to eq([assessment])
    end
  end

  describe "GET #show" do
    it "assigns the requested quizzes_assessment as @quizzes_assessment" do
      assessment = Quizzes::Assessment.create! valid_attributes
      get :show, {:id => assessment.to_param}, valid_session
      expect(assigns(:quizzes_assessment)).to eq(assessment)
    end
  end

  describe "GET #new" do
    it "assigns a new quizzes_assessment as @quizzes_assessment" do
      get :new, {}, valid_session
      expect(assigns(:quizzes_assessment)).to be_a_new(Quizzes::Assessment)
    end
  end

  describe "GET #edit" do
    it "assigns the requested quizzes_assessment as @quizzes_assessment" do
      assessment = Quizzes::Assessment.create! valid_attributes
      get :edit, {:id => assessment.to_param}, valid_session
      expect(assigns(:quizzes_assessment)).to eq(assessment)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Quizzes::Assessment" do
        expect {
          post :create, {:quizzes_assessment => valid_attributes}, valid_session
        }.to change(Quizzes::Assessment, :count).by(1)
      end

      it "assigns a newly created quizzes_assessment as @quizzes_assessment" do
        post :create, {:quizzes_assessment => valid_attributes}, valid_session
        expect(assigns(:quizzes_assessment)).to be_a(Quizzes::Assessment)
        expect(assigns(:quizzes_assessment)).to be_persisted
      end

      it "redirects to the created quizzes_assessment" do
        post :create, {:quizzes_assessment => valid_attributes}, valid_session
        expect(response).to redirect_to(Quizzes::Assessment.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved quizzes_assessment as @quizzes_assessment" do
        post :create, {:quizzes_assessment => invalid_attributes}, valid_session
        expect(assigns(:quizzes_assessment)).to be_a_new(Quizzes::Assessment)
      end

      it "re-renders the 'new' template" do
        post :create, {:quizzes_assessment => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested quizzes_assessment" do
        assessment = Quizzes::Assessment.create! valid_attributes
        put :update, {:id => assessment.to_param, :quizzes_assessment => new_attributes}, valid_session
        assessment.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested quizzes_assessment as @quizzes_assessment" do
        assessment = Quizzes::Assessment.create! valid_attributes
        put :update, {:id => assessment.to_param, :quizzes_assessment => valid_attributes}, valid_session
        expect(assigns(:quizzes_assessment)).to eq(assessment)
      end

      it "redirects to the quizzes_assessment" do
        assessment = Quizzes::Assessment.create! valid_attributes
        put :update, {:id => assessment.to_param, :quizzes_assessment => valid_attributes}, valid_session
        expect(response).to redirect_to(assessment)
      end
    end

    context "with invalid params" do
      it "assigns the quizzes_assessment as @quizzes_assessment" do
        assessment = Quizzes::Assessment.create! valid_attributes
        put :update, {:id => assessment.to_param, :quizzes_assessment => invalid_attributes}, valid_session
        expect(assigns(:quizzes_assessment)).to eq(assessment)
      end

      it "re-renders the 'edit' template" do
        assessment = Quizzes::Assessment.create! valid_attributes
        put :update, {:id => assessment.to_param, :quizzes_assessment => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested quizzes_assessment" do
      assessment = Quizzes::Assessment.create! valid_attributes
      expect {
        delete :destroy, {:id => assessment.to_param}, valid_session
      }.to change(Quizzes::Assessment, :count).by(-1)
    end

    it "redirects to the quizzes_assessments list" do
      assessment = Quizzes::Assessment.create! valid_attributes
      delete :destroy, {:id => assessment.to_param}, valid_session
      expect(response).to redirect_to(quizzes_assessments_url)
    end
  end

end
