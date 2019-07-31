module Cloudpayments
  class Configuration
    attr_accessor :base_url, :login, :password

    BASE_URL = "https://api.cloudpayments.ru".freeze

    def initialize
      @base_url = BASE_URL
    end
  end
end
