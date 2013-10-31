class Admin::ArticlesController < Admin::Base
  def index
    @articles = Article.order('released_at DESC')
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to [:admin, @article], notice: 'article saved'
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    @article.assign_attributes(article_params)
    if @article.save
      redirect_to [:admin, @article], notice: 'article updated'
    else
      render 'edit'
    end
  end

  def article_params
    params.require(:article).permit(:title, :body, :released_at, :expired_at, :member_only)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to :admin_articles
  end
end
