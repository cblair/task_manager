class MilestonesController < ApplicationController
  # GET /milestones
  # GET /milestones.json
  def index
    @milestones = Milestone.find(:all, :order => :due_date)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @milestones }
    end
  end

  # GET /milestones/1
  # GET /milestones/1.json
  def show
    @milestone = Milestone.find(params[:id])
    
    milestone_total_act_minutes = 0
    milestone_total_est_minutes = 0
    @milestone_completed = true #until proven false
    @milestone.tasks.each do |task|
      @milestone_completed = @milestone_completed & task.completed
      
      begin
        total_est_minute = (task.est_hour * 60) + task.est_minute 
        milestone_total_est_minutes += total_est_minute
      rescue
        milestone_total_est_minutes = 0
      end
      begin
        total_act_minute = (task.act_hour * 60) + task.act_minute

        milestone_total_act_minutes += total_act_minute
      rescue
        milestone_total_act_minutes += 0
      end
    end
    
    @milestone_total_act_hours = milestone_total_act_minutes / 60 
    @milestone_total_est_hours = milestone_total_est_minutes / 60
    
    @milestone_progress = 
      (@milestone_total_act_hours.to_f / @milestone_total_est_hours.to_f) * 100
    
    if @milestone_progress > 100
      flash[:alert]='Actual times are over estimated times'
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @milestone }
    end
  end

  # GET /milestones/new
  # GET /milestones/new.json
  def new
    @milestone = Milestone.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @milestone }
    end
  end

  # GET /milestones/1/edit
  def edit
    @milestone = Milestone.find(params[:id])
  end

  # POST /milestones
  # POST /milestones.json
  def create
    @milestone = Milestone.new(params[:milestone])

    respond_to do |format|
      if @milestone.save
        format.html { redirect_to @milestone, notice: 'Milestone was successfully created.' }
        format.json { render json: @milestone, status: :created, location: @milestone }
      else
        format.html { render action: "new" }
        format.json { render json: @milestone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /milestones/1
  # PUT /milestones/1.json
  def update
    @milestone = Milestone.find(params[:id])

    respond_to do |format|
      if @milestone.update_attributes(params[:milestone])
        format.html { redirect_to @milestone, notice: 'Milestone was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @milestone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /milestones/1
  # DELETE /milestones/1.json
  def destroy
    @milestone = Milestone.find(params[:id])
    @milestone.destroy

    respond_to do |format|
      format.html { redirect_to milestones_url }
      format.json { head :no_content }
    end
  end
end
