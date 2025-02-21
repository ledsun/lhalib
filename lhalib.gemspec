# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

def read_version
  File.open('ext/lhalib.c').each_line do |x|
    m = /LHALIB_VERSION\s+"(.+?)"/.match(x)
    if m
      return m[1]
    end
  end
  nil
end

Gem::Specification.new do |spec|
  spec.name          = "lhalib"
  spec.version       = "0.8.2"
  spec.authors       = ["Daiki Maruta"]
  spec.email         = ["rmswimkktt@gmail.com"]

  spec.summary       = %q{LhaLib to Bundler}
  #spec.description   = %q{TODO: Write a longer description or delete this line.}
  #spec.homepage      = "TODO: Put your gem's website or public repo URL here."

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  #if spec.respond_to?(:metadata)
  #  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  #else
  #  raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  #end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.extensions    = ["ext/extconf.rb"]
end
