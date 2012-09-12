class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    sort_by = "id"
    if defined? params[:sort_by]
      sort_by = params[:sort_by]
    end
    @tasks = Task.all(:order => sort_by)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    #add add_time to the task act_time
    if @task[:act_hour] == nil
      @task[:act_hour] = 0
    end
    if @task[:act_minute] == nil
      @task[:act_minute] = 0
    end
    
    minutes = 
      params["task"][:act_minute].to_i + params[:add_minute].to_i
    
    #carry over minutes to hours
    carry_hours = minutes / 60
      
    params["task"][:act_minute] = minutes.remainder(60)
    
    params["task"][:act_hour] = 
      (params["task"][:act_hour].to_i + params[:add_hour].to_i + carry_hours).to_s  

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
end
