require_relative 'lib/mintotp/version'

Gem::Specification.new do |spec|
  spec.name          = "mintotp"
  spec.version       = Mintotp::VERSION
  spec.authors       = ["win"]
  spec.email         = ["winhtaikaung28@hotmail.com"]

  spec.summary       = %q{Mintotp is a minimal TOTP generator written in Ruby}
  spec.description   = %q{TOTP stands for Time-Based One-Time Password. Many websites and services require two-factor authentication (2FA) or multi-factor authentication (MFA) where the user is required to present two or more pieces of evidence:  Something only the user knows, e.g., password, passphrase, etc.  Something only the user has, e.g., hardware token, mobile phone, etc.   Something only the user is, e.g., biometrics.  TOTP stands for Time-Based One-Time Password. Many websites and services require two-factor authentication (2FA) or multi-factor authentication (MFA) where the user is required to present two or more pieces of evidence. A TOTP value serves as the second factor, i.e., it proves that the user is in possession of a device (e.g., mobile phone) that contains a TOTP secret key from which the TOTP value is generated. Usually the service provider that provides a user's account also issues a secret key encoded either as a Base32 string or as a QR code. This secret key is added to an authenticator app (e.g., Google Authenticator) on a mobile device. The app can then generate TOTP values based on the current time. By default, it generates a new TOTP value every 30 seconds.}
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

  spec.add_runtime_dependency 'base32', '~> 0.3.2'
end
