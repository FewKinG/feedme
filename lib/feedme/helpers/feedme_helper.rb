module Feedme
  module Helpers

    module FeedmeHelper
  
      def feedme(model, &proc)
	builder = Feedme::Builder.new(model)
	output = "<div class=\"feedme\" id=\"feedme_#{model}\">"
	output << capture(builder, &proc)
	output << render(:partial => "feedme/feedme.html.erb", :locals => {:model => model})
	output << "</div>"
	output.html_safe
      end

    end

  end
end
