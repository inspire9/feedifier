# coding: utf-8
Gem::Specification.new do |spec|
  spec.name          = "feedifier"
  spec.version       = '0.0.1'
  spec.authors       = ["Pat Allan"]
  spec.email         = ["pat@freelancing-gods.com"]
  spec.summary       = %q{Feed engine for Rails}
  spec.homepage      = 'https://github.com/inspire9/feedifier'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
end
