class SessionsController < ApplicationController
  #login
  def create
    member = Member.authenticate(params[:email], params[:password])
    if member
      session[:member_id] = member.id
    else
      flash.alert = 'mail & pass is not correct'
    end
    redirect_to params[:from] || :root
  end

  #logout
  def destroy
    session.delete(:member_id)
    redirect_to :root
  end
end
