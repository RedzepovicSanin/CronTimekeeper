class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    flash.notice = 'No page found!'
    redirect_to root_path
  end

  # redirecting unauthorized accesses to root page and giving proper message
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to root_url, notice: "Unauthorized access!" }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
  # redirecting searches for users that doesn't exist
  rescue_from ActiveRecord::RecordNotFound do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to users_path, notice: "That user doesn't exist!" }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
end
