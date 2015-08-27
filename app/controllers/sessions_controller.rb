class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :update, :destroy]
  skip_action_callback :require_login, only: [:new, :create]

  # GET /sessions
  # GET /sessions.json
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @sessions = @user.sessions
    else
      @sessions = Session.all
    end
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
  end

  # GET /sessions/new
  def new
    redirect_to user_session_path(current_user, current_session) if logged_in?
    @session = Session.new
  end

  # POST /sessions
  # POST /sessions.json
  def create
    @session = Session.new(session_params)
    @session.request = request

    respond_to do |format|
      if @session.save
        session[:id] = @session.id
        format.html { redirect_to @session }
        format.json { render :show, status: :created, location: @session }
      else
        sleep 4
        format.html { render :new }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    reset_session
    redirect_to new_session_path, notice: 'You have been logged out'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.require(:session).permit(:email, :password)
    end
end
