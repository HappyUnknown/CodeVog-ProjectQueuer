class LogsController < ApplicationController
  before_action :set_log, only: %i[ show edit update destroy ]

  # GET /logs or /logs.json
  def index
    @logs = Log.all
  end

  # GET /logs/1 or /logs/1.json
  def show

  end

  # GET /logs/new
  def new
    @task_types = {1=>"Desktop", 2=>"Mobile", 3=>"Web app", 4=>"Crossplatform", 5=>"Game"}
    @task_priority = {1 => "Low", 2 => "Medium", 3 => "High"}
    @log = Log.new
  end

  # GET /logs/1/edit
  def edit
  end

  # POST /logs or /logs.json
  def create
    if project_exists
      @log = Log.new(log_params)
      respond_to do |format|
        if @log.save
          format.html { redirect_to log_url(@log), notice: "Log was successfully created." }
          format.json { render :show, status: :created, location: @log }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @log.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /logs/1 or /logs/1.json
  def update
    respond_to do |format|
      if @log.update(log_params)
        format.html { redirect_to log_url(@log), notice: "Log was successfully updated." }
        format.json { render :show, status: :ok, location: @log }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logs/1 or /logs/1.json
  def destroy
    @log.destroy

    respond_to do |format|
      format.html { redirect_to logs_url, notice: "Log was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = Log.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def log_params
      params.require(:log).permit(:DateRecieved, :DateFinished, :Comment, :TaskID)
    end

    def project_exists
      begin
        taskID = log_params[:TaskID]
        taskOnIDIsNull = Project.find(taskID).nil?
        puts "]=====================================> " + taskID.to_s
        puts "]=====================================> " + taskOnIDIsNull.to_s
        return true
      rescue
        return false
      end
    end    
end
