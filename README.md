# ActiverecordSansRails (Deprecated)

Please have a look at [standard_migrations](https://github.com/thuss/standalone-migrations) gem instead. Thanks.

This gem makes it easier to install rake task needed to use activerecord in your non-rails project.

It's mainly a gemified and slightly improved (added a way to pass different envs) version of a
[gist](https://gist.github.com/schickling/6762581) I found online.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerecord_sans_rails', git: 'https://github.com/andhapp/activerecord_sans_rails.git'
```

And then execute:

    $ bundle

## Usage

Add the following code in your app's Rakefile:

```ruby
require 'activerecord_sans_rails'

ActiverecordSansRails::load_rake_tasks
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/activerecord_sans_rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

