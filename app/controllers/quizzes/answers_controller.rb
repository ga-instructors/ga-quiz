class Quizzes::AnswersController < ApplicationController
  before_action :set_quizzes_answer, only: [:show, :edit, :update, :destroy]

  # GET /quizzes/answers
  # GET /quizzes/answers.json
  def index
    @quizzes_answers = Quizzes::Answer.all
  end

  # GET /quizzes/answers/1
  # GET /quizzes/answers/1.json
  def show
  end

  # GET /quizzes/answers/new
  def new
    @quizzes_answer = Quizzes::Answer.new
  end

  # GET /quizzes/answers/1/edit
  def edit
  end

  # POST /quizzes/answers
  # POST /quizzes/answers.json
  def create
    @quizzes_answer = Quizzes::Answer.new(quizzes_answer_params)

    respond_to do |format|
      if @quizzes_answer.save
        format.html { redirect_to @quizzes_answer, notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @quizzes_answer }
      else
        format.html { render :new }
        format.json { render json: @quizzes_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzes/answers/1
  # PATCH/PUT /quizzes/answers/1.json
  def update
    respond_to do |format|
      if @quizzes_answer.update(quizzes_answer_params)
        format.html { redirect_to quiz_assessments_path(@quizzes_answer.assessment.quiz) }
        format.json { render :show, status: :ok, location: @quizzes_answer }
      else
        format.html { render :edit }
        format.json { render json: @quizzes_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/answers/1
  # DELETE /quizzes/answers/1.json
  def destroy
    @quizzes_answer.destroy
    respond_to do |format|
      format.html { redirect_to quizzes_answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quizzes_answer
      @quizzes_answer = Quizzes::Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quizzes_answer_params
      params.require(:quizzes_answer).permit(:grade, :reviewer_comment)
    end
end
