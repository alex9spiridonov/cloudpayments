module Cloudpayments
  module Client
    module Request
      module Receipts
        class Create < Cloudpayments::Client::Request::Base
          attr_reader :params

          def initialize(params)
            @params = params
          end

          def call
            post("kkt/receipt", params)
          end
        end
      end
    end
  end
end
