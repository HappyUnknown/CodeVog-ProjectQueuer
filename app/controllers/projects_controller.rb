class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  class Object; def ensure_array; [self] end end
  class Array; def ensure_array; to_a end end
  class NilClass; def ensure_array; to_a end end

  # GET /projects or /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1 or /projects/1.json
  def show
    @task_types = {1=>"Desktop", 2=>"Mobile", 3=>"Web app", 4=>"Crossplatform", 5=>"Game"}
    @task_priority = {1 => "Low", 2 => "Medium", 3 => "High"}

    current = nil
    id = true
    begin
      current = Project.find(params[:id])
    rescue
      id = false
      current = Project.find_by(ViewCode: params[:id])
    ensure
      puts "]=>=>=>=>=> ID: " + id.to_s
      @project = current
    end
  end

  # GET /projects/new
  def new
    @task_types = {1=>"Desktop", 2=>"Mobile", 3=>"Web app", 4=>"Crossplatform", 5=>"Game"}
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    rawArgument = params[:id]
    indexof = rawArgument.index '/'
    argument = rawArgument
    current = nil
    id = true
    begin
      current = Project.find(argument)
    rescue
      id = false
      current = Project.find_by(ViewCode: argument)
    ensure
      puts "]=>=>=>=>=> ID: " + id.to_s
      @project = current
    end
  end

  # POST /projects or /projects.json
  def create
    uniqueCode = Project.find_by(ViewCode: params[:ViewCode]).nil?
    if uniqueCode
      @project = Project.new(project_params)
      respond_to do |format|
        if @project.save
          format.html { redirect_to project_url(@project), notice: "Project was successfully created." }
          format.json { render :show, status: :created, location: @project }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
    else
      puts "CANNOT CREATE WITH THIS VIEWCODE"
      @flash_msg = "CANNOT CREATE WITH THIS VIEWCODE"
      render partial: 'layouts/alerts'
      #flash.now[:notice] = 'Alert'
      return
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to project_url(@project), notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    Project.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      #@project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:Name, :Description, :ViewCode)
    end
end
