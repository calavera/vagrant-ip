# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name          = "vagrant-ip"
  gem.version       = "0.1.0"
  gem.authors       = ["David Calavera"]
  gem.email         = ["david.calavera@gmail.com"]
  gem.description   = %q{Get the IP from the bridged guest}
  gem.summary       = gem.description
  gem.homepage      = "http://github.com/calavera/vagrant-ip"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
