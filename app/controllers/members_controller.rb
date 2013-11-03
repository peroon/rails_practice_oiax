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

    if params[:format].in?(['jpg', 'png', 'gif'])
      send_image
    else
      render 'members/show'
    end
  end

  private
  def send_image
    if @member.image.present?
      send_data @member.image.data,
        type: @member.image.content_type, disposition: 'inline'
    else
      raise NotFound
    end
  end

end
