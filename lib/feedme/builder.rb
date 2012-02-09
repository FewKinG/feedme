module Feedme
  extend ActiveSupport::Autoload

  class Builder

    include Element
    include Elements::Stars
    include Elements::Text

    attr_accessor :model

    def initialize(model)
      self.model = model
    end

  end

end
