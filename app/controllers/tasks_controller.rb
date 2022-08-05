class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    @task_priority = {1 => "Low", 2 => "Medium", 3 => "High"}
    @task_types = {1=>"Desktop", 2=>"Mobile", 3=>"Web app", 4=>"Crossplatform", 5=>"Game"}
    @tasks = Task.all
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    @task_priority = {1 => "Low", 2 => "Medium", 3 => "High"}
    @task_types = {1=>"Desktop", 2=>"Mobile", 3=>"Web app", 4=>"Crossplatform", 5=>"Game"}
  end

  # GET /tasks/new
  def new
    @member_hash = User.all.collect {|u| [ u.email, u.id ] }
    @project_hash = Project.all.collect{|p|[p.Name, p.id]}
    @task_priority = {1 => "Low", 2 => "Medium", 3 => "High"}
    @task_types = {1=>"Desktop", 2=>"Mobile", 3=>"Web app", 4=>"Crossplatform", 5=>"Game"}
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    if project_exists && executor_exists && author_exists
      @task = Task.new(task_params)
      respond_to do |format|
        if @task.save
          format.html { redirect_to task_url(@task), notice: "Task was successfully created." }
          format.json { render :show, status: :created, location: @task }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
    else
      @flash_msg = "CANNOT CREATE WITH THIS FOREIGN KEYS"
      render partial: 'layouts/alerts'
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to task_url(@task), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:Topic, :Description, :StartDate, :ExpireDate, :Type, :Priority, :Comments, :ExecutorUID, :AuthorUID, :ProjectID)
    end

    def project_exists
      begin
        projectID = task_params[:ProjectID]
        projectOnIDIsNull = Project.find(projectID).nil?
        puts "]=====================================> " + projectID.to_s
        puts "]=====================================> " + projectOnIDIsNull.to_s
        return true
      rescue
        return false
      end
    end    
    def executor_exists
      begin
        userID = task_params[:ExecutorUID]
        userOnIDIsNull = User.find(userID).nil?
        puts "]=====================================> " + userID.to_s
        puts "]=====================================> " + userID.to_s
        return true
      rescue
        return false
      end
    end    
    def author_exists
      begin
        userID = task_params[:AuthorUID]
        userOnIDIsNull = User.find(userID).nil?
        puts "]=====================================> " + userID.to_s
        puts "]=====================================> " + userID.to_s
        return true
      rescue
        return false
      end
    end
end
