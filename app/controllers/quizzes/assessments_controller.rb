class Quizzes::AssessmentsController < ApplicationController
  before_action :set_quizzes_assessment, only: [:show, :edit, :update, :destroy]

  # GET /quizzes/assessments
  # GET /quizzes/assessments.json
  def index
    @quizzes_assessments = Quizzes::Assessment.all
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
        format.html { redirect_to edit_quizzes_assessment_path(@quizzes_assessment), notice: 'Assessment was successfully created.' }
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
        format.html { redirect_to @quizzes_assessment, notice: 'Assessment was successfully updated.' }
        format.json { render :show, status: :ok, location: @quizzes_assessment }
      else
        format.html { render :edit }
        format.json { render json: @quizzes_assessment.errors, status: :unprocessable_entity }
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
    # Use callbacks to share common setup or constraints between actions.
    def set_quizzes_assessment
      @assessment = @quizzes_assessment = Quizzes::Assessment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quizzes_assessment_params
      params.require(:quizzes_assessment).permit(:quiz_id, :student_comment)
    end
end
