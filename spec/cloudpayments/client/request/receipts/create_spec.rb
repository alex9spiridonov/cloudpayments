require "spec_helper"

describe Cloudpayments::Client::Request::Receipts::Create do
  describe "#call" do
    before do
      Cloudpayments.configure do |config|
        config.login = "alex"
        config.password = "1234"
      end
    end

    context "with auto-generated request_id" do
      it "sends valid request with auto-generated X-Request-ID" do
        params = { "Inn" => "7708806062" }
        request = described_class.new(params)

        stub_request(:post, "https://api.cloudpayments.ru/kkt/receipt")
        request.call

        expect(request.request_id).not_to be_nil
        expect(request.request_id).to match(/^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i)
      end

      it "sends X-Request-ID header with auto-generated UUID" do
        params = { "Inn" => "7708806062" }
        request = described_class.new(params)

        stub_request(:post, "https://api.cloudpayments.ru/kkt/receipt")
        request.call

        expect(WebMock).to have_requested(:post, "https://api.cloudpayments.ru/kkt/receipt").
          with(headers: { "Authorization" => "Basic YWxleDoxMjM0", "X-Request-ID" => request.request_id })
      end
    end

    context "with custom request_id" do
      it "sends X-Request-ID header when request_id is provided" do
        params = { "Inn" => "7708806062" }
        request_id = "abc-123-xyz"

        stub_request(:post, "https://api.cloudpayments.ru/kkt/receipt")
        described_class.new(params, request_id: request_id).call

        expect(WebMock).to have_requested(:post, "https://api.cloudpayments.ru/kkt/receipt").
          with(body: params, headers: { "Authorization" => "Basic YWxleDoxMjM0", "X-Request-ID" => request_id })
      end

      it "stores custom request_id in reader attribute" do
        params = { "Inn" => "7708806062" }
        request_id = "custom-request-id-123"

        request = described_class.new(params, request_id: request_id)

        expect(request.request_id).to eq(request_id)
      end
    end

    context "with full receipt params" do
      it "sends complete receipt data with X-Request-ID" do
        params = {
          "Inn" => "7708806062",
          "Type" => 0,
          "Items" => [
            {
              "Name" => "Товар",
              "Price" => 100,
              "Quantity" => 1,
              "Amount" => 100,
              "Tax" => 1,
              "PaymentMethod" => 0,
              "PaymentObject" => 0
            }
          ]
        }
        request_id = "receipt-uuid-123"

        stub_request(:post, "https://api.cloudpayments.ru/kkt/receipt")
        described_class.new(params, request_id: request_id).call

        expect(WebMock).to have_requested(:post, "https://api.cloudpayments.ru/kkt/receipt").
          with(body: params, headers: { "Authorization" => "Basic YWxleDoxMjM0", "X-Request-ID" => request_id })
      end
    end
  end
end
