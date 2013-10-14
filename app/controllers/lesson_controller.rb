class LessonController < ApplicationController
  def step1
    render text: "こんにちは #{params[:name]} " + request.remote_ip

  end
end
