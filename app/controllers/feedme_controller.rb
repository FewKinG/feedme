class FeedmeController < ApplicationController

  def create
    model = params[:model]
    klass = model.classify.constantize
    obj = klass.new(params[:elements])
    @feedme_object = obj
    @success = obj.save 
    render :partial => "feedme/create_#{model.to_s}"
  end

  def new
    model = params[:model]
    render :partial => "feedme/show_#{model.to_s}" 
  end

end
