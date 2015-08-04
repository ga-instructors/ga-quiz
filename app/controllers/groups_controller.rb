class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :copy, :destroy]

  before_action except: :show do
    forbidden unless \
      group_role?(@group, :member, :owner, :instructor) ||
      group_role?(Group.administrators, :member, :owner)
  end

  before_action only: :show do
    forbidden unless \
      group_role?(@group, :member, :owner, :instructor, :student) ||
      group_role?(Group.administrators, :member, :owner)
  end

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        @group.group_members.create!(user: current_user, role: 'owner')
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /groups/1/copy
  # GET /groups/1/copy.json
  def copy
    @group_copy = @group.deep_clone include: {:quizzes => :questions}
    respond_to do |format|
      if @group_copy.save
        format.html { redirect_to edit_group_url(@group_copy), notice: 'Group was successfully copied.'}
        format.json { render :show, status: :created, location: @group_copy }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :start_at, :end_at, group_members_attributes: [:id, :role, :_destroy])
    end
end
