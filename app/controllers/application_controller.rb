class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authorize

  class Forbidden < StandardError; end

  private
  def authorize
    if session[:member_id]
      @current_member = Member.find_by_id(session[:member_id])
      session.delete(:member_id) unless @current_member
    end
  end

  def login_required
    raise Forbidden unless @current_member
  end
end

