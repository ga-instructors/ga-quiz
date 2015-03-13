class UsersController < ApplicationController

  private

  # Use callbacks to share common setup or constraints between actions.
  before_action :set_group
  def set_group
    @group = Group.find(params[:group_id]) if params[:group_id]
  end

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def set_user
    if @group
      @user = @group.users.find(params[:id])
      @group_member = @group.group_members.where(user: @user).first
    else
      @user = User.find(params[:id])
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password_digest)
  end

  public

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if @group
      @assessment = @user.answers.joins(:question).select('quizzes_questions.topic, quizzes_answers.grade').group('quizzes_questions.topic')
      @performance = Hash[@assessment.average('quizzes_answers.grade').sort_by{|k,v|v.to_f}]
      @completed_assessments = @user.assessments.finished
      render "show-#{@group_member.role}"
    end
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

end
