module Feedme

	module Elements

		module Select

			include ActionView::Helpers::FormOptionsHelper 

			def select(id, description, opts, options = {})
				if options[:prompt]
					opts = [[options[:prompt], ""]] + opts
				end
				element id, description, options.merge(:classes => "select") do
					output = select_tag "feedme_#{model}_select_#{id}", options_for_select(opts), :class => "feedme-input value"
				end
			end

		end

	end

end
