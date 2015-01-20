# Splendid

[![Gem Version](https://badge.fury.io/rb/splendid.png)](http://badge.fury.io/rb/splendid)

Want to test if a webpage looks as expected? Use splendid in your tests to make sure styles are not broken on your site!

## Installation

Add this line to your application's Gemfile:

    gem 'splendid'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install splendid

## Usage

TODO: More instruction coming soon, API will possibly change quite a bit soon as it is very early in development.

In your rspec capybara tests use the following matcher
```
expect(page).to be_splendid
```
This will on first run learn what your page looks like, then on subsequent runs will diff news versions of the page to that.

## Contributing

1. Fork it ( http://github.com/<my-github-username>/splendid/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
