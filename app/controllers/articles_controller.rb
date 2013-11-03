class ArticlesController < ApplicationController
  def index
    #@articles = Article.order('released_at DESC')
    @articles = Article.readable_for(@current_member).order('released_at DESC').paginate(page: params[:page], per_page: 3)
  end

  def show
    @article = Article.find(params[:id])
  end
end
