class FeedmeController < ApplicationController

  def create
    model = params[:module]
    render :partial => "feedme/create_#{model.to_s}"
  end

  def new
    model = params[:module]
    render :partial => "feedme/show_#{model.to_s}" 
  end

end
