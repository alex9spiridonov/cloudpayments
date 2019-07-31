module Cloudpayments
  module Client
    module Response
      class Base
        attr_reader :response

        def initialize(response)
          @response = response
        end

        def success?
          response.success? && body.success?
        end

        def body
          @_body ||= Body.new(response)
        end

        def error
          return if success?
          return response.reason_phrase unless response.success?
          body.message
        end
      end
    end
  end
end
