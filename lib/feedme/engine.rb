module Feedme
  class Engine < ::Rails::Engine
    initializer 'feedme.initialize' do
      ActiveSupport.on_load(:action_view) do
	include Feedme::Helpers::FeedmeHelper
      end
    end
  end
end
