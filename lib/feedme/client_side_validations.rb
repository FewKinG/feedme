module Feedme

	module ClientSideValidations

		attr_accessor :validate_on_client
		attr_accessor :validate_options

		def validate_on_client!(options = {})
			self.validate_on_client = true
			self.validate_options = options
		end

		def validate_on_client?
			!!self.validate_on_client
		end

	end

end
