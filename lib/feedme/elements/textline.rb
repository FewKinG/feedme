module Feedme

	module Elements

		module Textline

			include ActionView::Helpers::FormTagHelper

			def textline(id, description, options = {})
				element id, description, options.merge(:classes => "textline") do
					output = text_field_tag "feedme_#{model}_textline_#{id}", nil, :class => "feedme-input value"
				end
			end

		end

	end

end
