class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @admins = Admin.all 
    @employees = Employee.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: "#{@user.type} #{@user.first_name} #{@user.last_name} was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: "#{@user.type} #{@user.first_name} #{@user.last_name} was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: "#{@user.type} #{@user.first_name} #{@user.last_name} deleted." }
      format.json { head :no_content }
    end
  end

  def fetch_hours
    # hardkodirani eventi
    events = [
      {
        title: 'Working',
        start: '2018-08-27T08:00:00',
        end: '2018-08-27T17:00:00'
      },
      {
        title: 'Working',
        start: '2018-08-28T08:15:00',
        end: '2018-08-28T17:15:00'
      }
    ]

    render json: events
  end
  helper_method :fetch_hours

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :type, :password, :password_confirmation)
    end
end
