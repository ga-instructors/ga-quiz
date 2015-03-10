class Quizzes::QuestionsController < ApplicationController
  before_action :set_quizzes_question, only: [:show, :edit, :update, :destroy]

  # GET /quizzes/questions
  # GET /quizzes/questions.json
  def index
    @quizzes_questions = Quizzes::Question.all
  end

  # GET /quizzes/questions/1
  # GET /quizzes/questions/1.json
  def show
  end

  # GET /quizzes/questions/new
  def new
    @quizzes_question = Quizzes::Question.new
  end

  # GET /quizzes/questions/1/edit
  def edit
  end

  # POST /quizzes/questions
  # POST /quizzes/questions.json
  def create
    @quizzes_question = Quizzes::Question.new(quizzes_question_params)

    respond_to do |format|
      if @quizzes_question.save
        format.html { redirect_to @quizzes_question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @quizzes_question }
      else
        format.html { render :new }
        format.json { render json: @quizzes_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzes/questions/1
  # PATCH/PUT /quizzes/questions/1.json
  def update
    respond_to do |format|
      if @quizzes_question.update(quizzes_question_params)
        format.html { redirect_to @quizzes_question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @quizzes_question }
      else
        format.html { render :edit }
        format.json { render json: @quizzes_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/questions/1
  # DELETE /quizzes/questions/1.json
  def destroy
    @quizzes_question.destroy
    respond_to do |format|
      format.html { redirect_to quizzes_questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quizzes_question
      @quizzes_question = Quizzes::Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quizzes_question_params
      params.require(:quizzes_question).permit(:quiz_id, :ordinal, :question, :open_ended, :answer, :answer_option_id, :answer_template)
    end
end
