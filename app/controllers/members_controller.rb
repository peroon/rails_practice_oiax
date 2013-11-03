class MembersController < ApplicationController
  before_filter :login_required

  def index
    @members = Member.order("number").paginate(page: params[:page], per_page: 5)
    session[:user_id] = rand 1000
    cookies.signed[:cookie_id] = rand 1000
  end

  def show
    @member = Member.find(params[:id])
    @user_id = session[:user_id]
    @cookie_id = cookies.signed[:cookie_id]
  end
end
