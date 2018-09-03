class EventsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    if Event.where(user_id: params[:user_id])
      @events = Event.where(user_id: params[:user_id])
      render json: @events
    end
  end

  def generate
    @user = User.find(params[:user_id])
    beginDate = DateTime.parse(params[:start]).beginning_of_day
    endDate = DateTime.parse(params[:end]).end_of_day
      
    while(beginDate < endDate) do
      eventForWorking = Event.between(beginDate.beginning_of_day, beginDate.end_of_day).where(event_type: 'working')
      eventForBreak = Event.between(beginDate.beginning_of_day, beginDate.end_of_day).where(event_type: 'break')

      if eventForWorking.empty?
        unless (beginDate.saturday? or beginDate.sunday?)
          randomHour = rand(8..9)
          randomMinute = rand(0..59)
          Event.create!(
            event_type: 'working',
            start_at: Time.parse("#{randomHour + 2}:#{randomMinute}", beginDate),
            end_at: Time.parse("#{randomHour + 10}:#{randomMinute}", beginDate),
            user_id: @user.id)
        end  
      end

      if eventForBreak.empty?
        unless (beginDate.saturday? or beginDate.sunday?)
          randomHour = rand(11..14)
          randomMinute = rand(0..59)
          timeForBreak = Time.parse("#{randomHour + 2}:#{randomMinute}", beginDate)
          Event.create!(
            event_type: 'break',
            start_at: timeForBreak,
            end_at: timeForBreak + 30*60,
            user_id: @user.id)
        end  
      end

      beginDate += 1.day
    end

    respond_to do |format|
        format.html { redirect_to users_path, notice: "Hours generated for #{@user.first_name} #{@user.last_name}." }
        format.json { render json: { message: 'Hours generated!' } }
    end
  end

  def event_params
    params.permit(:event_type, :start_at, :end_at, :user_id, :start, :end)
  end
end