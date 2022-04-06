lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "crypto_cold_store_client/version"

Gem::Specification.new do |spec|
  spec.name          = "crypto_cold_store_client"
  spec.version       = CryptoColdStoreClient::VERSION
  spec.authors       = ["Ace Subido"]
  spec.email         = ["ace.subido@gmail.com"]

  spec.summary       = %q{Ruby client for crypto-cold-store}
  spec.description   = %q{Ruby client for crypto-cold-store}
  spec.homepage      = "https://github.com/bloom-solutions/crypto_cold_store_client-ruby"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 5.0.0"
  spec.add_dependency "api_client_base", "~> 1.4"
  spec.add_dependency "gem_config", "~> 0.3.1"
  spec.add_dependency "typhoeus", "~> 1.3"
  spec.add_dependency "virtus", ">= 1.0", "< 3"
  spec.add_dependency "dry-validation", ">= 0.13", "< 2"

  spec.add_development_dependency "bundler", "~> 2.2"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "rspec", "~> 3.8"
  spec.add_development_dependency "vcr", "~> 4.0"
  spec.add_development_dependency "webmock", "~> 3.4"
  spec.add_development_dependency "dotenv", "~> 2.5"
  spec.add_development_dependency "appraisal"
end
