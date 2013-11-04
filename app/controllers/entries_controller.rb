class EntriesController < ApplicationController
  before_filter :login_required, except: [:index, :show]

  def index
    if params[:member_id]
      @member = Member.find(params[:member_id])
      rel = @member.entries
    else
      rel = Entry
    end
    @entries = rel.readable_for(@current_member).order('posted_at DESC').paginate(page: params[:page], per_page: 5)
  end

  def show
    @entry = Entry.readable_for(@current_member).find(params[:id])
  end

  def new 
    @entry = Entry.new(posted_at: Time.current)
  end

  def edit
    @entry = @current_member.entries.find(params[:id])
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.author = @current_member
    if @entry.save
      redirect_to @entry, notice: 'entry created.'
    else
      render 'new'
    end
  end

  def update
    @entry = @current_member.entries.find(params[:id])
    @entry.assign_attributes(entry_params)
    if @entry.save
      redirect_to @entry, notice: 'entry updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @entry = @current_member.entries.find(params[:id])
    @entry.destroy
    redirect_to [@current_member, :entries], notice: 'entry deleted.'
  end

  def entry_params
    params.require(:entry).permit(
      :member_id,
      :title,
      :body,
      :posted_at,
      :status,

      vote_attributes: [:entry_id, :member_id] #memer_image
    )
  end

  def like
    @entry = Entry.published.find(params[:id])
    #@current_member.voted_entries << @entry
    @current_member.voted_entries << entry_params
    redirect_to @entry, notice: 'voted'
  end


end













