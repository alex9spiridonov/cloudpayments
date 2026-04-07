module Cloudpayments
  module Client
    module Request
      module Receipts
        class Create < Cloudpayments::Client::Request::Base
          attr_reader :params, :request_id

          def initialize(params, request_id: SecureRandom.uuid)
            @params = params
            @request_id = request_id
          end

          def call
            post("kkt/receipt", params, { "X-Request-ID" => request_id })
          end
        end
      end
    end
  end
end
