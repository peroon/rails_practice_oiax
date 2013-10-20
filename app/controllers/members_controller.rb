class MembersController < ApplicationController
  def index
    @members = Member.order("number")
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new(birthday: Date.new(1980, 1, 1))
  end

  def edit
    @member = Member.find(params[:id])
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to @member, notice: "member registered."
    else
      render 'new'
    end
  end

  def member_params
    params.require(:member).permit(:number, :name, :full_name, :gender, :birthday, :email, :administrator)
  end
  
  def update
    @member = Member.find(params[:id])
    @member.assign_attributes(member_params)
    if @member.save
      redirect_to @member, notice: 'member updated.'
    else
      render 'edit'
    end
  end
  
  def destroy
  end

  def search
    @members = Member.search(params[:q])
    render 'index'
  end
end
