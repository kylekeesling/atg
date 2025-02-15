# ATG

This gem provides a way to communicate with automatic tank gauges (ATGs) via serial (RS-232), Telnet, or Telnet via SSH.

All serial commands are documented in the accompanying PDF reference manual [Serial Interface-TLS-350.pdf](https://github.com/kylekeesling/atg/blob/master/Serial%20Interface-TLS-350.pdf).

## Installation

    $ bundle add atg

Or install it yourself as:

    $ gem install atg

## Usage

Examples of how to use the gem can be found in the `examples` folder

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).
