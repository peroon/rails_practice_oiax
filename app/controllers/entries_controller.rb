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
end
