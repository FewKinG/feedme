require "feedme/version"
require "feedme/engine" if defined?(::Rails)

module Feedme
  extend ActiveSupport::Autoload

  autoload :Element
  autoload :Stars
  autoload :Builder

  module Helpers
    extend ActiveSupport::Autoload
    autoload :FeedmeHelper
  end

  module Elements
    extend ActiveSupport::Autoload
    autoload :Stars
    autoload :Text
  end

end
