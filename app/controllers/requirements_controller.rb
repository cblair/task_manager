class RequirementsController < ApplicationController
  # GET /requirements
  # GET /requirements.json
  def index
    @requirements = Requirement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @requirements }
    end
  end

  # GET /requirements/1
  # GET /requirements/1.json
  def show
    @requirement = Requirement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @requirement }
    end
  end

  # GET /requirements/new
  # GET /requirements/new.json
  def new
    #if a category linked to us, use it for forms
    begin
      @specification = Specification.find(params[:specification_id])
      specification_id = @specification.id
    rescue
      @specification = nil
      specification_id = nil
    end
    
    @requirement = Requirement.new(:specification_id => specification_id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @requirement }
    end
  end

  # GET /requirements/1/edit
  def edit
    @requirement = Requirement.find(params[:id])
  end

  # POST /requirements
  # POST /requirements.json
  def create
    @requirement = Requirement.new(params[:requirement])

    respond_to do |format|
      if @requirement.save
        format.html { redirect_to @requirement.specification, 
                      notice: 'Requirement was successfully created.' }
        format.json { render json: @requirement.specification, 
                      status: :created, location: @requirement }
      else
        format.html { render action: "new" }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /requirements/1
  # PUT /requirements/1.json
  def update
    @requirement = Requirement.find(params[:id])

    respond_to do |format|
      if @requirement.update_attributes(params[:requirement])
        format.html { redirect_to @requirement.specification, 
                      notice: 'Requirement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requirements/1
  # DELETE /requirements/1.json
  def destroy
    @requirement = Requirement.find(params[:id])
    specification = @requirement.specification
    @requirement.destroy

    respond_to do |format|
      format.html { redirect_to :controller => "specifications", 
                                :action => "show", :id => specification.id }
      format.json { head :no_content }
    end
  end
end
