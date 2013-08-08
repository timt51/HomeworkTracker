class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]
  before_action :set_schedule, only: [:show, :edit, :update, :destroy, :index]
  before_action :all_assignments_due_dates, only: [:index]
  before_action :make_schedule, only: [:index]
  # GET /assignments
  # GET /assignments.json
  def index
    @assignments = Assignment.all.sort_by(&:created_at).reverse.sort_by { |assignment| [assignment.complete ? 1 : 0 ] }
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
  end

  # GET /assignments/new
  def new
    @completion_times = ["10 minutes", "15 minutes", "30 minutes", "45 miuntes", "1 hour"]
    @assignment = Assignment.new
  end

  # GET /assignments/1/edit
  def edit
  end

  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = Assignment.new(assignment_params)
    @assignment.user_id = session[:user_id]

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to root_path, notice: 'Assignment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @assignment }
      else
        format.html { render action: 'new' }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignments/1
  # PATCH/PUT /assignments/1.json
  def update
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to root_path, notice: 'Assignment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to assignments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find_or_initialize_by_id(params[:id], user_id: session[:user_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_params
      params.require(:assignment).permit(:title, :description, :image_url, :due_date, :user_id, :complete, :estimated_completion_time)
    end
  end
