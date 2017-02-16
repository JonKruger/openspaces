class SessionsApiController < ApplicationController
  before_action :set_default_response_format
  before_action :set_session, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token  

  # GET /sessions
  # GET /sessions.json
  def index
    since = params[:since] || Date.parse("January 1, 1970")
    @sessions = Session.enabled.select { |s| s.updated_at >= since }
    
    # only bring back all of the supporting data if this is the initial load
    unless params[:since] 
      @time_slots = TimeSlot.select { |ts| ts.enabled }.sort { |x,y| x.start_time <=> y.start_time }.to_a
      @meeting_spaces = MeetingSpace.all.order :name

      if params[:time_slot_id]
        @current_time_slot = @time_slots.select {|ts|ts.id == params[:time_slot_id].to_i}.first
      else
        sorted_time_slots = @time_slots.sort {|x,y| x.start_time <=> y.start_time}
        @current_time_slot = sorted_time_slots.select {|ts| ts.end_time >= Time.now}.first
        @current_time_slot = sorted_time_slots.first unless @current_time_slot
      end

      @prev_time_slots = {}
      @next_time_slots = {}
      for i in 0..@time_slots.length-1
        @prev_time_slots[@time_slots[i].id] = (@time_slots[i-1].id if i > 0)
        @next_time_slots[@time_slots[i].id] = (@time_slots[i+1].id if i < (@time_slots.length - 1))
      end
    end

    result = {
      :sessions => @sessions.map { |s| s.as_json.merge({:twitter_url => s.twitter_url}) },
      :time_slots => @time_slots,
      :meeting_spaces => @meeting_spaces,
      :current_time_slot => @current_time_slot,
      :prev_time_slots => @prev_time_slots,
      :next_time_slots => @next_time_slots
    }
    render json: result
  end
  
  def edit
    @session = Session.find(params[:id])
    render json: (@session ? @session.as_json.merge({:twitter_url => @session.twitter_url}) : nil)
  end

  def save
    if Settings.readonly 
      result = {success: false, errors: "Sessions cannot be updated at this time"}
    else
      data = session_params
      puts "*************** data is #{data}"
      session = Session.find_by_id(data[:id]) || Session.new
      session.update_attributes(data)

      if session.save
        result = {success: true}
      else
        result = {success: false, errors: session.errors}
      end
    end
    render :json => result
  end

  def destroy
    return if Settings.readonly 

    @session.destroy
    respond_to do |format|
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
      puts ">>>> I got #{params}"
      p = params.permit(:id, :title, :owner, :twitter_handle, :time_slot_id, :meeting_space_id, :since)
      p[:twitter_handle] = p[:twitter_handle].gsub '@','' if p[:twitter_handle]
      p
    end

    def set_default_response_format
      request.format = :json
    end
end
