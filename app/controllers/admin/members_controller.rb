class Admin::MembersController < Admin::Base

  def index
    @members = Member.order("number")
    session[:user_id] = rand 1000
    cookies.signed[:cookie_id] = rand 1000
  end

  def show
    @member = Member.find(params[:id])
    @user_id = session[:user_id]
    @cookie_id = cookies.signed[:cookie_id]
  end

  def new
    @member = Member.new(birthday: Date.new(1980, 1, 1))
    @member.build_image
  end

  def edit
    @member = Member.find(params[:id])
    @member.build_image unless @member.image
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to [:admin, @member], notice: "member registered."
    else
      render 'new'
    end
  end

  def member_params
    params.require(:member).permit(
      :number, :name, :full_name, :gender, 
      :birthday, :email, :administrator, 
      :password, :password_confirmation,

      image_attributes: [:uploaded_image]
    )
  end
  
  def update
    p params[:member]

    logger.debug 'A'
    logger.debug 'A'
    logger.debug 'A'
    logger.debug 'A'
    logger.debug 'A'
    logger.debug 'A'
    logger.debug 'params[:member]'
    logger.debug params[:member]

    @member = Member.find(params[:id])
    @member.assign_attributes(member_params)
    if @member.save
      redirect_to [:admin, @member], notice: 'member updated.'
    else
      render 'edit', notice: 'member not updated...'
    end
  end
  
  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to :admin_members, notice: 'member deleted.'
  end

  def search
    @members = Member.search(params[:q])
    render 'index'
  end
end
