module Feedme

	module Elements

		module Stars

			def stars(id, description, number, options = {})
				default = options[:default] || 0
				element id, description, options.merge(:classes => "stars") do
					output = "<div class=\"star_list\">"
					output << number.times.collect{|num|
						"<span class=\"star star_#{num} #{"active" if num == default}\" data-num=\"#{num}\">*</span>"
					}.join
					output << "</div>"
				end
			end	  

		end

	end

end
