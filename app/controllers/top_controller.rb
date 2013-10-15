class TopController < ApplicationController
  def index
    @message = 'hello rails'
  end

  def about
    @page_title = 'about page title'
  end
end
