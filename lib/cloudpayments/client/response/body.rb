module Cloudpayments
  module Client
    module Response
      class Body
        attr_reader :body

        def initialize(response)
          @body = JSON.parse(response.body)
        end

        def message
          body["Message"]
        end

        def model
          body["Model"]
        end

        def model_id
          model["Id"]
        end

        def success?
          body["Success"]
        end
      end
    end
  end
end
