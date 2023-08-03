Gem::Specification.new do |s|
  s.name = "cloudpayments"
  s.version = "0.4.0"
  s.date = "2019-11-19"
  s.summary = "Сloudpayments API wrapper"
  s.authors = ["Alexey Spiridonov"]
  s.email = "alex9spiridonov@gmail.com"
  s.files = Dir["lib/**/*", "README.md"]
  s.homepage = "https://rubygems.org/gems/cloudpayments"
  s.license = "MIT"
  s.add_runtime_dependency 'faraday', '~> 2.7.10'
end
