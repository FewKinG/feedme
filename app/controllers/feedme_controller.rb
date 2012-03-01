class FeedmeController < ApplicationController

  def create
    model = params[:model]
    klass = model.classify.constantize
    obj = klass.new
    if params[:elements]
      params[:elements].each do |k,v|
	if k
	  obj.send("#{k.to_s}=", v)
	end
      end
    end
    @feedme_object = obj
    @success = obj.save 
    render :partial => "feedme/create_#{model.to_s}"
  end

  def new
    model = params[:model]
    render :partial => "feedme/show_#{model.to_s}" 
  end

end
