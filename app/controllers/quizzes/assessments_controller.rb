require 'standard_deviation'

class Quizzes::AssessmentsController < ApplicationController
  before_action :set_quizzes_assessment, only: [:show, :edit, :update, :destroy]

  # GET /quizzes/assessments
  # GET /quizzes/assessments.json
  def index
    @quiz = Quizzes::Quiz.find(params[:quiz_id])
    @quizzes_assessments = @quiz.assessments
    @averages = @quiz.assessments.completed.inject({}) { |averages, assessment| averages[assessment] = assessment.answers.average(:grade); averages }
    @deviation = @averages.values.compact.standard_deviation
    @class_average = @averages.values.compact.count > 0 ? (@averages.values.compact.sum / @averages.values.compact.count) : 0
    @assessments = @quizzes_assessments.sort_by { |assessment| @averages[assessment] || 0 }
  end

  # GET /quizzes/assessments/1
  # GET /quizzes/assessments/1.json
  def show
  end

  # GET /quizzes/assessments/new
  def new
    @quizzes_assessment = Quizzes::Assessment.new
  end

  # GET /quizzes/assessments/1/edit
  def edit
  end

  # POST /quizzes/assessments
  # POST /quizzes/assessments.json
  def create
    @quizzes_assessment = current_user.assessments.new(quizzes_assessment_params)

    respond_to do |format|
      if @quizzes_assessment.save
        format.html { redirect_to edit_quizzes_assessment_path(@quizzes_assessment), notice: 'Good Luck!' }
        format.json { render :show, status: :created, location: @quizzes_assessment }
      else
        format.html { render :new }
        format.json { render json: @quizzes_assessment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzes/assessments/1
  # PATCH/PUT /quizzes/assessments/1.json
  def update
    respond_to do |format|
      if @quizzes_assessment.update(quizzes_assessment_params)
        format.json { render :show, status: :ok, location: @quizzes_assessment }
        if params[:commit] =~ /finish/i
          @quizzes_assessment.touch(:finished_at)
          format.html { redirect_to @quizzes_assessment, notice: 'Assessment was successfully updated.' }
          format.js   { render text: "document.location.replace('#{quizzes_assessment_path(@quizzes_assessment)}')" }
        else
          format.html { redirect_to edit_quizzes_assessment_path(@quizzes_assessment), notice: 'Assessment was successfully updated.' }
          format.js   { render nothing: true }
        end
      else
        format.html { render :edit }
        format.json { render json: @quizzes_assessment.errors, status: :unprocessable_entity }
        format.js   { render json: @quizzes_assessment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/assessments/1
  # DELETE /quizzes/assessments/1.json
  def destroy
    @quizzes_assessment.destroy
    respond_to do |format|
      format.html { redirect_to quizzes_assessments_url, notice: 'Assessment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_quiz
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_quizzes_assessment
      if params[:quiz_id]
        @quiz = Quizzes::Quiz.find(params[:quiz_id]) if params[:quiz_id]
        @group = @quiz.group
        @assessment = @quiz.assessments.find(params[:id])
      else
        @assessment = Quizzes::Assessment.find(params[:id])
        @quiz = @assessment.quiz
        @group = @quiz.group
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quizzes_assessment_params
      params.require(:quizzes_assessment).permit(:quiz_id, :student_comment, answers_attributes: [:id, :answer, :question_option_id])
    end
end
