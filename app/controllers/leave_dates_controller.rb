class LeaveDatesController < ApplicationController
  before_action :set_leave_date, only: [:show, :edit, :update, :destroy]

  # GET /leave_dates
  # GET /leave_dates.json
  def index
    @leave_dates = LeaveDate.all
  end

  # GET /leave_dates/1
  # GET /leave_dates/1.json
  def show
  end

  # GET /leave_dates/new
  def new
    @leave_date = LeaveDate.new
  end

  # GET /leave_dates/1/edit
  def edit
  end

  # POST /leave_dates
  # POST /leave_dates.json
  def create
    @leave_date = LeaveDate.new(leave_date_params)

    respond_to do |format|
      if @leave_date.save
        format.html { redirect_to @leave_date, notice: 'Leave date was successfully created.' }
        format.json { render :show, status: :created, location: @leave_date }
      else
        format.html { render :new }
        format.json { render json: @leave_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leave_dates/1
  # PATCH/PUT /leave_dates/1.json
  def update
    respond_to do |format|
      if @leave_date.update(leave_date_params)
        format.html { redirect_to @leave_date, notice: 'Leave date was successfully updated.' }
        format.json { render :show, status: :ok, location: @leave_date }
      else
        format.html { render :edit }
        format.json { render json: @leave_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leave_dates/1
  # DELETE /leave_dates/1.json
  def destroy
    @leave_date.destroy
    respond_to do |format|
      format.html { redirect_to leave_dates_url, notice: 'Leave date was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leave_date
      @leave_date = LeaveDate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leave_date_params
      params.require(:leave_date).permit(:leave_date, :leave_type, :leave_id)
    end
end
