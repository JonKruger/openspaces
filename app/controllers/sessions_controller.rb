class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :update, :destroy]

  # GET /sessions
  # GET /sessions.json
  def index
    @sessions = Session.all
    @time_slots = TimeSlot.all.order(:start_time).to_a
    @meeting_spaces = MeetingSpace.all.order :name

    if params[:time_slot_id]
      @current_time_slot = @time_slots.select {|ts|ts.id == params[:time_slot_id].to_i}.first
    else
      @current_time_slot = @time_slots.sort {|x,y| x.start_time <=> y.start_time}.select {|ts| ts.end_time >= Time.now}.first
    end

    @prev_time_slots = {}
    @next_time_slots = {}
    for i in 0..@time_slots.length-1
      @prev_time_slots[@time_slots[i].id] = (@time_slots[i-1].id if i > 0)
      @next_time_slots[@time_slots[i].id] = (@time_slots[i+1].id if i < (@time_slots.length - 1))
    end
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
  end

  # GET /sessions/new
  def new
    @session = Session.new

    if (params[:time_slot_id])
      time_slot = TimeSlot.find_by_id(params[:time_slot_id])
      @session.time_slot_id = time_slot.id if time_slot
    end

    if (params[:meeting_space_id])
      meeting_space = MeetingSpace.find_by_id params[:meeting_space_id]
      @session.meeting_space_id = meeting_space.id if meeting_space
    end
  end

  # GET /sessions/1/edit
  def edit

  end

  # POST /sessions
  # POST /sessions.json
  def create
    @session = Session.new(session_params)

    respond_to do |format|
      if @session.save
        format.html { redirect_to sessions_url, notice: 'Session was successfully created.' }
        format.json { render :show, status: :created, location: @session }
      else
        format.html { render :new }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sessions/1
  # PATCH/PUT /sessions/1.json
  def update
    respond_to do |format|
      if @session.update(session_params)
        format.html { redirect_to @session, notice: 'Session was successfully updated.' }
        format.json { render :show, status: :ok, location: @session }
      else
        format.html { render :edit }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    @session.destroy
    respond_to do |format|
      format.html { redirect_to sessions_url, notice: 'Session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.require(:session).permit(:title, :owner, :twitter_handle, :time_slot_id, :meeting_space_id)
    end
end
