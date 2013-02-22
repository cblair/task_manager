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

    @user_email = ""
    if @task.user
      @user_email = @task.user.email
    end

    @assigned_user_email = ""
    if @task.assigned_user_id != nil
      @assigned_user_email = User.find(@task.assigned_user_id).email
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    #if a category linked to us, use it for forms
    begin
      @category = Category.find(params[:category_id])
      category_id = @category.id
    rescue
      @category = nil
      category_id = nil
    end

    @task = Task.new(:category_id => category_id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
    
    @user_email = ""
    if @task.user
      @user_email = @task.user.email
    end
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])
    @task.user = current_user #owner

    respond_to do |format|
      if @task.save
        #let's tell the assigned user about this task
        UserMailer.add_user_to_task(User.find(params[:task][:assigned_user_id]),@task).deliver

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

    #let's tell the assigned user about this task
    if @task.assigned_user_id != params[:task][:assigned_user_id].to_i
      UserMailer.add_user_to_task(User.find(params[:task][:assigned_user_id]),@task).deliver
      @task.assigned_user_id = params[:task][:assigned_user_id].to_i
    end
    
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
    category = @task.category
    
    @task.destroy

    respond_to do |format|
      if category == nil
        format.html { redirect_to tasks_url }
      else
        format.html { redirect_to category }
       end
      format.json { head :no_content }
    end
  end
end
