class Quizzes::QuizzesController < ApplicationController
  before_action :set_quizzes_quiz, only: [:show, :edit, :update, :destroy]

  # GET /quizzes/quizzes
  # GET /quizzes/quizzes.json
  def index
    @quizzes_quizzes = Quizzes::Quiz.all
  end

  # GET /quizzes/quizzes/1
  # GET /quizzes/quizzes/1.json
  def show
  end

  # GET /quizzes/quizzes/new
  def new
    @quizzes_quiz = Quizzes::Quiz.new
  end

  # GET /quizzes/quizzes/1/edit
  def edit
  end

  # POST /quizzes/quizzes
  # POST /quizzes/quizzes.json
  def create
    @quizzes_quiz = Quizzes::Quiz.new(quizzes_quiz_params)

    respond_to do |format|
      if @quizzes_quiz.save
        format.html { redirect_to @quizzes_quiz, notice: 'Quiz was successfully created.' }
        format.json { render :show, status: :created, location: @quizzes_quiz }
      else
        format.html { render :new }
        format.json { render json: @quizzes_quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzes/quizzes/1
  # PATCH/PUT /quizzes/quizzes/1.json
  def update
    respond_to do |format|
      if @quizzes_quiz.update(quizzes_quiz_params)
        format.html { redirect_to @quizzes_quiz, notice: 'Quiz was successfully updated.' }
        format.json { render :show, status: :ok, location: @quizzes_quiz }
      else
        format.html { render :edit }
        format.json { render json: @quizzes_quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/quizzes/1
  # DELETE /quizzes/quizzes/1.json
  def destroy
    @quizzes_quiz.destroy
    respond_to do |format|
      format.html { redirect_to quizzes_quizzes_url, notice: 'Quiz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quizzes_quiz
      @quizzes_quiz = Quizzes::Quiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quizzes_quiz_params
      params.require(:quizzes_quiz).permit(:group_id, :name, :start_at, :end_at, :introduction)
    end
end
