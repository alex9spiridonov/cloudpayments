# Cloudpayments

A Ruby wrapper for cloudpayments

## Installation

```rb
# Gemfile
gem "cloudpayments", "~> 0.4.0"
```

```bash
$ bundle install
```

## Usage:

```rb
# config/initializers/cloudpayments.rb
require "cloudpayments"

Cloudpayments.configure do |config|
  config.login = "login"
  config.password = "password"
end
```

```rb
request_params = {
  "Inn" => inn,
  "Type" => format_receipt_type,
  "CustomerReceipt" => {
    "Items" => [{
      "Label" => label,
      "Quantity" => 1,
      "Amount" => amount,
      "Price" => amount,
      "Vat" => "",
      "Method" => 1,
      "Object" => 10
    }],
    "calculationPlace" => calculation_place,
    "TaxationSystem" => 0,
    "Email" => email,
    "Amounts" => {
      "Electronic" => amount
    }
  }
}

response = Cloudpayments::Client::Request::Receipts::Create.call(request_params)
response.success?

receipt_ofd_id = response.body.model_id

response = Cloudpayments::Client::Request::Receipts::GetStatus.call(receipt_ofd_id)
status = response.body.model
```
