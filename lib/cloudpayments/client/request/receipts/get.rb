module Cloudpayments
  module Client
    module Request
      module Receipts
        class Get < Cloudpayments::Client::Request::Base
          attr_reader :id, :request_id

          def initialize(id, request_id: SecureRandom.uuid)
            @id = id
            @request_id = request_id
          end

          def call
            post("kkt/receipt/get", { Id: id }, { "X-Request-ID" => request_id })
          end
        end
      end
    end
  end
end
