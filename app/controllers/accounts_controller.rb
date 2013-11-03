class AccountsController < ApplicationController
  before_filter :login_required

  def show
    @member = @current_member
  end

  def edit
    @member = @current_member
    @member.build_image unless @member.image
  end

  def update
    @member = @current_member
    @member.assign_attributes(member_params)
    if @member.save
      redirect_to :account, notice: 'account updated.'
    else
      render 'edit'
    end
  end

  def member_params
    params.require(:member).permit(
      :number, 
      :name, 
      :full_name, 
      :gender, 
      :birthday, 
      :email, 
      #:administrator, 
      :password, 
      :password_confirmation)
  end

end
