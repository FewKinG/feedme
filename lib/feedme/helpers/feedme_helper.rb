module Feedme
  module Helpers

    module FeedmeHelper
  
      def feedme(model, options = {}, &proc)
	builder = Feedme::Builder.new(model)
	options = {:remote => false}.merge(options)
	output = "<div class=\"feedme\" id=\"feedme_#{model}\">"
	output << capture(builder, &proc)
	output << form_tag(feedme_index_url, :remote => options[:remote], :id => "feedme_form_#{model}") do
	  submit_tag "Submit"
	end
	output << render(:partial => "feedme/feedme.html.erb", :locals => {:model => model})
	output << "</div>"
	output.html_safe
      end

    end

  end
end
