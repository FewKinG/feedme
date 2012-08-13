module Feedme
  module Helpers

    module FeedmeHelper
  
			def feedme(model, options = {}, &proc)
				@builder = Feedme::Builder.new(model)
				options = {:remote => false, :submit => "Submit", :submit_options => {}}.merge(options)
				output = "<div class=\"feedme\" id=\"feedme_#{model}\">"
				output << form_tag("#", :id => "feedme_inputs_#{model}") do 
					capture(@builder, &proc)
				end
				output << form_tag(feedme_index_url(:model => model), :remote => options[:remote], :id => "feedme_form_#{model}") do
					submit_tag options[:submit], "data-disabled-text" => options[:submit_options][:disabled_text]
				end
				output << render(:partial => "feedme/feedme.html.erb", :locals => {:model => model})
				output << "</div>"
				output.html_safe
			end

		end

	end
end
