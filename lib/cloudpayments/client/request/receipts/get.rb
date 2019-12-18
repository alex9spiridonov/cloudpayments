module Cloudpayments
  module Client
    module Request
      module Receipts
        class Get < Cloudpayments::Client::Request::Base
          attr_reader :id

          def initialize(id)
            @id = id
          end

          def call
            post("kkt/receipt/get", { Id: id })
          end
        end
      end
    end
  end
end
