module Cloudpayments
  module Connection
    def post(path, data = {}, headers = {})
      request(:post, path, data, headers)
    end

    private

    def request(method, path, data, headers = {})
      connection.send(method) do |req|
        req.url path
        req.headers["Content-Type"] = "application/json"
        req.headers.merge!(headers)
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
