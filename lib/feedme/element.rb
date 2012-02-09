module Feedme

  module Element

    def element(id, description, options = {}, &block)
      output = "<div id=\"feedme_#{model}_#{id.to_s}\" class=\"element #{options[:classes]}\">"
      output << "<span class=\"description\">#{description}</span><br>"
      output << block.call
      output << "</div>"
      output.html_safe
    end

  end


end
