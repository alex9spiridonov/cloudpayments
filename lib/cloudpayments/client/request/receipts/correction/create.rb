module Cloudpayments
  module Client
    module Request
      module Receipts
        module Correction
          class Create < Cloudpayments::Client::Request::Base
            attr_reader :params, :request_id

            def initialize(params, request_id: SecureRandom.uuid)
              @params = params
              @request_id = request_id
            end

            def call
              post("kkt/correction-receipt", params, { "X-Request-ID" => request_id })
            end
          end
        end
      end
    end
  end
end
