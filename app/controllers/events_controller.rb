class EventsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    - if Event.where(user_id: params[:user_id])
      @events = Event.where(user_id: params[:user_id])
      render json: @events
    end
  end

  def create
    @user = User.find(params[:user_id])
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save!
        format.html { redirect_to users_path, notice: "Hours generated for #{@user.first_name} #{@user.last_name}." }
        format.json { render json: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def event_params
    params.permit(:event_type, :start_at, :end_at, :user_id)
  end
end