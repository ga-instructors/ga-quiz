class Quizzes::QuizzesController < ApplicationController
  before_action :set_group
  before_action :set_quizzes_quiz, only: [:show, :edit, :update, :destroy]
  helper_method :group_role? #TODO: Replace me with Pundit

  before_action except: [:show, :index] do
    forbidden unless \
      group_role?(@group, :member, :owner, :instructor) ||
      group_role?(Group.administrators, :member, :owner)
  end

  before_action only: [:show, :index] do
    forbidden unless \
      group_role?(@group, :member, :owner, :instructor, :student) ||
      group_role?(Group.administrators, :member, :owner)
  end

  # GET /quizzes/quizzes
  # GET /quizzes/quizzes.json
  def index
    if @group
      @quizzes = @quizzes_quizzes = @group.quizzes
    else
      @quizzes_quizzes = Quizzes::Quiz.all
    end
  end

  # GET /quizzes/quizzes/1
  # GET /quizzes/quizzes/1.json
  def show
  end

  # GET /quizzes/quizzes/new
  def new
    if params[:group_id]
      @quizzes_quiz = Quizzes::Quiz.new(group_id: params[:group_id])
    else
      @quizzes_quiz = Quizzes::Quiz.new
    end
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
        format.html { redirect_to new_quiz_question_path(@quizzes_quiz), notice: 'Quiz was successfully created.' }
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
        format.html { redirect_to quiz_questions_path(@quizzes_quiz), notice: 'Quiz was successfully updated.' }
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
    def set_group
      if params[:group_id] || params[:quizzes_quiz].try(:[], :group_id)
        @group = Group.find(params[:group_id] || params[:quizzes_quiz][:group_id])
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_quizzes_quiz
      @quizzes_quiz = @group ? @group.quizzes.find(params[:id]) : Quizzes::Quiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quizzes_quiz_params
      params.require(:quizzes_quiz).permit(:group_id, :name, :start_at, :end_at, :introduction, :ordinal)
    end
end
