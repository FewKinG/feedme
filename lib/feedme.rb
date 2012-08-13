require "feedme/version"
require "feedme/engine" if defined?(::Rails)

module Feedme
  extend ActiveSupport::Autoload

  autoload :Element
  autoload :Builder
	autoload :ClientSideValidations

  module Helpers
    extend ActiveSupport::Autoload
    autoload :FeedmeHelper
  end

  module Elements
    extend ActiveSupport::Autoload
    autoload :Stars
    autoload :Text
		autoload :Textline
		autoload :Select
  end

end
