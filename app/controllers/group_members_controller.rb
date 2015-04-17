class GroupMembersController < ApplicationController
  before_action :set_group_member, only: [:show, :edit, :update, :destroy]

  before_action do
    forbidden unless \
      group_role?(@group, :member, :owner, :instructor) ||
      group_role?(Group.administrators, :member, :owner)
  end

  # GET /group_members
  # GET /group_members.json
  def index
    respond_to do |format|
      format.html { redirect_to group_path(@group) }
      format.json
    end
  end

  # GET /group_members/1
  # GET /group_members/1.json
  def show
    respond_to do |format|
      format.html { redirect_to group_user_path(@group, @group.user) }
      format.json
    end
  end

  # GET /group_members/new
  def new
    @group = Group.find(params[:group_id])
    @group_member = @group.group_members.new
  end

  # GET /group_members/1/edit
  def edit
  end

  # POST /group_members
  # POST /group_members.json
  def create
    @group_member = GroupMember.new(group_member_params)
    @group = @group_member.group

    respond_to do |format|
      if @group_member.save
        format.html { redirect_to new_group_member_path(@group), notice: 'Group member was successfully created.' }
        format.json { render :show, status: :created, location: @group_member }
      else
        format.html { render :new }
        format.json { render json: @group_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_members/1
  # PATCH/PUT /group_members/1.json
  def update
    @group = @group_member.group

    respond_to do |format|
      if @group_member.update(group_member_params)
        format.html { redirect_to new_group_member_path(@group), notice: 'Group member was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_member }
      else
        format.html { render :edit }
        format.json { render json: @group_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_members/1
  # DELETE /group_members/1.json
  def destroy
    @group_member.destroy
    respond_to do |format|
      format.html { redirect_to group_members_url, notice: 'Group member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_member
      if params[:group_id]
        @group = Group.find(params[:group_id])
        @group_member = @group.group_members.find(params[:id])
      else
        @group_member = GroupMember.find(params[:id])
        @group = @group_member.group
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_member_params
      params.require(:group_member).permit(:group_id, :name, :email, :role, :invitation_blurb)
    end
end
