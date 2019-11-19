module Cloudpayments
  module Client
    module Request
      module Receipts
        class GetStatus < Cloudpayments::Client::Request::Base
          attr_reader :id

          def initialize(id)
            @id = id
          end

          def call
            post("kkt/receipt/status/get", { Id: id })
          end
        end
      end
    end
  end
end
