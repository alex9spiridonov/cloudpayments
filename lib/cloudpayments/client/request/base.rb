module Cloudpayments
  module Client
    module Request
      class Base
        include Cloudpayments::Connection

        def self.call(*args, &block)
          response = new(*args, &block).call
          Cloudpayments::Client::Response::Base.new(response)
        end
      end
    end
  end
end
