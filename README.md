# ActiveSupport::Refinements

ActiveSupport + Ruby 2.0 Refinements

## Warning (or why this gem might be totally useless for you)

This project was created for experimenting the initial implementation of Ruby 2.0 Refinements.
And unfortunately, due to the Refinements' spec change, this library does not work under Ruby 2.0.0 stable.

## Installation

Add this line to your application's Gemfile:

    gem 'activesupport-refinements'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activesupport-refinements

## Usage

You can pick some side-effect-free clean core_ext features by requiring 'active_support/refinements/core_ext/**/*' and `using` modules defined there.
See specs for more details.

You can also regenerate newer version of ActiveSupport::Refinements by running `refine_core_ext.rb` script.

Note that not all modules are working ATM.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
