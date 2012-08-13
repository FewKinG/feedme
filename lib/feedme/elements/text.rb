module Feedme

  module Elements

    module Text

      include ActionView::Helpers::FormTagHelper 

      def text(id, description, options = {})
				element id, description, options.merge(:classes => "text") do
					output = text_area_tag "feedme_#{model}_text_#{id}", nil, :class => "feedme-input value"
				end
      end

    end

  end

end
