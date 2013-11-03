class TopController < ApplicationController
  def index
    @articles = Article.readable_for(@current_member).order("released_at DESC").limit(5)
  end

  def about
    @page_title = 'about page title'
  end

  def not_found
    raise ActionController::RoutingError, "no route...>< #{request.path.inspect}"
  end
end
