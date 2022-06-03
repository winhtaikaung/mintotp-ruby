require_relative 'lib/mintotp/version'

Gem::Specification.new do |spec|
  spec.name          = "mintotp"
  spec.version       = Mintotp::VERSION
  spec.authors       = ["win"]
  spec.email         = ["winhtaikaung28@hotmail.com"]

  spec.summary       = %q{Generate and validate totp token, see RFC 6238}
  spec.description   = %q{Generate and validate totp token, see RFC 6238. Very simple implementation so far.}
  spec.homepage      = "https://github.com/winhtaikaung/mintotp-ruby"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/winhtaikaung/mintotp-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/winhtaikaung/mintotp-ruby/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
