class ProblemsController < ApplicationController
  before_action :set_problem, only: [:show, :edit, :update, :destroy, :liking]

  # GET /problems
  # GET /problems.json
  def index
    @problems = Problem.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
    @problem = Problem.new
  end

  # GET /problems/1
  # GET /problems/1.json
  def show
  end

  # GET /problems/new
  def new
    @problem = Problem.new
  end

  # GET /problems/1/edit
  def edit
  end

  # POST /problems
  # POST /problems.json
  def create
    @problem = Problem.new(problem_params)
    @problem.likes = 0
    respond_to do |format|
      if @problem.save
        format.html { redirect_to problems_url, success: 'Frustration was successfully created.' }
        format.json { render :show, status: :created, location: @problem }
      else
        format.html { render :new }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /problems/1
  # PATCH/PUT /problems/1.json
  def update
    respond_to do |format|
      if @problem.update(problem_params)
        format.html { redirect_to @problem, success: 'Frustration was successfully updated.' }
        format.json { render :show, status: :ok, location: @problem }
      else
        format.html { render :edit }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /problems/1
  # DELETE /problems/1.json
  def destroy
    @problem.destroy
    respond_to do |format|
      format.html { redirect_to problems_url, info: 'Frustration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def liking
  if (@problem.likes == nil)
     @problem.likes = 0
   end
  @problem.likes += 1
  @problem.save
  respond_to do |format|
    format.html { redirect_to problems_url }
    format.js 
  end
end

private

  

    # Use callbacks to share common setup or constraints between actions.
    def set_problem
      @problem = Problem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def problem_params
      params.require(:problem).permit(:description)
    end
end










