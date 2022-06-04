# Mintotp

Mintotp is a minimal TOTP generator written in Ruby. Inspired by [this library](https://github.com/susam/mintotp).

[![Mintotp](https://github.com/winhtaikaung/mintotp-ruby/actions/workflows/gem-test-push.yml/badge.svg)](https://github.com/winhtaikaung/mintotp-ruby/actions/workflows/gem-test-push.yml) 

[![GitHub issues](https://img.shields.io/github/issues/winhtaikaung/mintotp-ruby)](https://github.com/winhtaikaung/mintotp-ruby/issues)
[![GitHub license](https://img.shields.io/github/license/winhtaikaung/mintotp-ruby)](https://github.com/winhtaikaung/mintotp-ruby/blob/main/LICENSE.txt)


<!-- Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/mintotp`. To experiment with that code, run `bin/console` for an interactive prompt. -->

<!-- TODO: Delete this and the text above, and describe your gem -->

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mintotp'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install mintotp

## Usage

```ruby
    SECRET1 = "ZYTYYE5FOAGW5ML7LRWUL4WTZLNJAMZS"
    minTotp = Mintotp::TOTP.new()
    minTotp.totp(SECRET1) # => return the same time based token from Google Authenticator
```
Source Code
-----------

At the heart of the TOTP algorithm lies the HOTP algorithm. HOTP stands
for HMAC-based One-Time Password. HMAC stands for Hash-based Message
Authentication Code. Here are the relevant RFCs to learn more about
these algorithms:

  - [RFC 2104]: HMAC: Keyed-Hashing for Message Authentication
  - [RFC 4226]: HOTP: An HMAC-Based One-Time Password Algorithm
  - [RFC 6238]: TOTP: Time-Based One-Time Password Algorithm

[RFC 2104]: https://tools.ietf.org/html/rfc2104
[RFC 4226]: https://tools.ietf.org/html/rfc4226
[RFC 6238]: https://tools.ietf.org/html/rfc6238

The source code in [`totp.rb`](https://github.com/winhtaikaung/mintotp-ruby/blob/main/lib/mintotp/totp.rb) generates TOTP values from a
secret key and current time. Here is the entire code presented once again for convenience:

```ruby
require 'base32'
require 'openssl'

module Mintotp
  class TOTP
    #
    # @key : secret key
    # @time_step : TimeStep Second Default is 30 Second
    # @digits : Number of digits that will generate
    # @digest : hash name
    #
    def totp(key, time_step=30, digits=6, digest='sha1')
      hotp(key, Time.now.to_i / time_step, digits, digest)
    end

    def hotp(key, counter, digits=6, digest='sha1')
      key = Base32.decode "#{key}#{"="* ((8-key.length)%8)}"
      sha = OpenSSL::Digest::Digest.new(digest)
      counter = [counter].pack('Q>')
      hmac= OpenSSL::HMAC.digest(sha, key, counter)
      
      offset = hmac.bytes.last & 0x0f   
      bytes = hmac.bytes[offset..offset+4]

      # unpack by bytes shifting
      bytes[0] = bytes[0] & 0x7f
      bytes_as_integer = (bytes[0] << 24) + (bytes[1] << 16) + (bytes[2] << 8) + bytes[3]
      bytes_as_integer.modulo(10 ** digits).to_s.rjust(digits,'0')
    end
  end
end
```

In the code above, we use the `hmac` module available in the Ruby
standard library to implement HOTP. The implementation can be found in
the `hotp()` function. It is a pretty straightforward implementation of
[RFC 2104: Section 5: HOTP Algorithm][RFC 2104-5]. It takes a
Base32-encoded secret key and a counter as input. It returns a 6-digit
HOTP value as output.

The `totp()` function implements the TOTP algorithm. It is a thin
wrapper around the HOTP algorithm. The TOTP value is obtained by
invoking the HOTP function with the secret key and the number of time
intervals (30 second intervals by default) that have elapsed since Unix
epoch (1970-01-01 00:00:00 UTC).

[RFC 2104-5]: https://tools.ietf.org/html/rfc4226#section-5


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/winhtaikaung/mintotp.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
