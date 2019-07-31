require "spec_helper"

describe Cloudpayments::Client::Request::Receipts::Create do
  describe "#call" do
    it "sends valid request" do
      Cloudpayments.configure do |config|
        config.login = "alex"
        config.password = "1234"
      end

      stub_request(:post, "https://api.cloudpayments.ru/kkt/receipt")
      params = { "Inn" => "7708806062" }

      described_class.new(params).call

      expect(WebMock).to have_requested(:post, "https://api.cloudpayments.ru/kkt/receipt").
        with(body: params, headers: { "Authorization" => "Basic YWxleDoxMjM0" })
    end
  end
end
