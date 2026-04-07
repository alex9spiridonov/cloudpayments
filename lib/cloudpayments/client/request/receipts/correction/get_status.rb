module Cloudpayments
  module Client
    module Request
      module Receipts
        module Correction
          class GetStatus < Cloudpayments::Client::Request::Base
            attr_reader :id, :request_id

            def initialize(id, request_id: SecureRandom.uuid)
              @id = id
              @request_id = request_id
            end

            def call
              post("kkt/correction-receipt/status/get", { Id: id }, { "X-Request-ID" => request_id })
            end
          end
        end
      end
    end
  end
end
