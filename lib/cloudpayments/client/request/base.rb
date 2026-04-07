module Cloudpayments
  module Client
    module Request
      class Base
        include Cloudpayments::Connection

        def self.call(*args, **kwargs, &block)
          response = new(*args, **kwargs, &block).call
          Cloudpayments::Client::Response::Base.new(response)
        end
      end
    end
  end
end
