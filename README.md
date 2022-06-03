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

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/winhtaikaung/mintotp.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
