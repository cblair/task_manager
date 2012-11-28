class WorkTimesController < ApplicationController
  # GET /work_times
  # GET /work_times.json
  def index
    @work_times = WorkTime.find(:all, :order => "id")

    if params.include?("task_id")
      @work_times = WorkTime.where(:task_id => params[:task_id])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @work_times }
    end
  end

  # GET /work_times/1
  # GET /work_times/1.json
  def show
    @work_time = WorkTime.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @work_time }
    end
  end

  # GET /work_times/new
  # GET /work_times/new.json
  def new
    @work_time = WorkTime.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @work_time }
    end
  end

  # GET /work_times/1/edit
  def edit
    @work_time = WorkTime.find(params[:id])
  end

  # POST /work_times
  # POST /work_times.json
  def create
    @work_time = WorkTime.new(params[:work_time])
    
    #have to update here, since jquery form updates don't happend before submit
    # request
    @work_time.end_time = DateTime.now

    respond_to do |format|
      if @work_time.save
        format.html { redirect_to @work_time, notice: 'Work time was successfully created.' }
        format.json { render json: @work_time, status: :created, location: @work_time }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @work_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /work_times/1
  # PUT /work_times/1.json
  def update
    @work_time = WorkTime.find(params[:id])

    respond_to do |format|
      if @work_time.update_attributes(params[:work_time])
        format.html { redirect_to @work_time, notice: 'Work time was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @work_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_times/1
  # DELETE /work_times/1.json
  def destroy
    @work_time = WorkTime.find(params[:id])
    @work_time.destroy

    respond_to do |format|
      format.html { redirect_to work_times_url }
      format.json { head :no_content }
      format.js
    end
  end
  
  def get_current_datetime
    respond_to do |format|
      format.json { render :json => DateTime.now }
    end
  end
end
