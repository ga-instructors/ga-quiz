class Groups::RegroupsController < ApplicationController
  before_action :set_group
  before_action :set_groups_regroup, only: [:show, :edit, :update, :destroy]

  # GET /groups/regroups
  # GET /groups/regroups.json
  def index
    @groups_regroups = Groups::Regroup.all
    @new_regroup = @group.regroups.new
  end

  # GET /groups/regroups/1
  # GET /groups/regroups/1.json
  def show
    @new_regroup = @group.regroups.new(@groups_regroup.attributes)
    respond_to do |format|
      format.any(:html, :json)
      format.md do
        response.headers['Content-Disposition'] = 'attachment; filename="' + @groups_regroup.name.parameterize + '.md"'
        render
      end
    end
  end

  # GET /groups/regroups/new
  def new
    @new_regroup = @group.regroups.new(groups_regroup_params)
    case params[:preset]
    when 'pair'
      @groups_regroup = @group.regroups.new(target_group_size: @group.students.count / 2)
      @groups_regroup.build
    when 'standup'
      @groups_regroup = @group.regroups.new(target_group_size: @group.instructors.count + @group.members.count)
      @groups_regroup.build
      @groups_regroup.regroup_groups.zip(@group.instructors + @group.members).each do |regroup, instructor|
        regroup.name = "#{instructor.name.split.first}'s Group"
      end
    when 'instructor'
      @groups_regroup = @group.regroups.new(target_group_size: @group.instructors.count)
      @groups_regroup.build
      @groups_regroup.regroup_groups.zip(@group.instructors).each do |regroup, instructor|
        regroup.name = "#{instructor.name.split.first}'s Group"
      end
    else
      @groups_regroup = @group.regroups.new(groups_regroup_params)
      @groups_regroup.build
    end
  end

  # GET /groups/regroups/1/edit
  def edit
  end

  # POST /groups/regroups
  # POST /groups/regroups.json
  def create
    @groups_regroup = Groups::Regroup.new(groups_regroup_params)
    @group = @groups_regroup.group

    respond_to do |format|
      if @groups_regroup.save
        format.html { redirect_to group_regroup_path(@group, @groups_regroup), notice: 'Regroup was successfully created.' }
        format.json { render :show, status: :created, location: @groups_regroup }
      else
        format.html { render :new }
        format.json { render json: @groups_regroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/regroups/1
  # PATCH/PUT /groups/regroups/1.json
  def update
    respond_to do |format|
      if @groups_regroup.update(groups_regroup_params)
        format.html { redirect_to @groups_regroup, notice: 'Regroup was successfully updated.' }
        format.json { render :show, status: :ok, location: @groups_regroup }
      else
        format.html { render :edit }
        format.json { render json: @groups_regroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/regroups/1
  # DELETE /groups/regroups/1.json
  def destroy
    @groups_regroup.destroy
    respond_to do |format|
      format.html { redirect_to groups_regroups_url, notice: 'Regroup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_group
      @group = Group.find(params[:group_id]) if params[:group_id]
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_groups_regroup
      @groups_regroup = Groups::Regroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def groups_regroup_params
      params.require(:groups_regroup).permit(:group_id, :name, :target_group_size, regroup_groups_attributes: [ :name, user_ids: [] ])
    end
end
