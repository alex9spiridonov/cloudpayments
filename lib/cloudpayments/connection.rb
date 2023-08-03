module Cloudpayments
  module Connection
    def post(path, data = {})
      request(:post, path, data)
    end

    private

    def request(method, path, data)
      connection.send(method) do |req|
        req.url path
        req.headers["Content-Type"] = "application/json"
        req.body = data.to_json
      end
    end

    def connection
      Faraday.new(config.base_url) do |conn|
        conn.request :authorization, :basic, config.login, config.password
      end
    end

    def config
      Cloudpayments.configuration
    end
  end
end
