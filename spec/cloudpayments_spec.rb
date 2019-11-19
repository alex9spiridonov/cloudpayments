require "spec_helper"

describe Cloudpayments do
  describe ".configure" do
    it "sets login" do
      login = "alex"
      Cloudpayments.configure { |config| config.login = login }
      expect(Cloudpayments.configuration.login).to eq(login)
    end

    it "sets password" do
      password = "1234"
      Cloudpayments.configure { |config| config.password = password }
      expect(Cloudpayments.configuration.password).to eq(password)
    end
  end
end
