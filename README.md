# [NanoTemplate](https://github.com/Narazaka/nano_template)

[![Gem](https://img.shields.io/gem/v/nano_template.svg)](https://rubygems.org/gems/nano_template)
[![Gem](https://img.shields.io/gem/dtv/nano_template.svg)](https://rubygems.org/gems/nano_template)
[![Gemnasium](https://gemnasium.com/Narazaka/nano_template.svg)](https://gemnasium.com/Narazaka/nano_template)
[![Inch CI](http://inch-ci.org/github/Narazaka/nano_template.svg)](http://inch-ci.org/github/Narazaka/nano_template)
[![Travis Build Status](https://travis-ci.org/Narazaka/nano_template.svg)](https://travis-ci.org/Narazaka/nano_template)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/Narazaka/nano_template?svg=true)](https://ci.appveyor.com/project/Narazaka/nano-template)
[![codecov.io](https://codecov.io/github/Narazaka/nano_template/coverage.svg?branch=master)](https://codecov.io/github/Narazaka/nano_template?branch=master)
[![Code Climate](https://codeclimate.com/github/Narazaka/nano_template/badges/gpa.svg)](https://codeclimate.com/github/Narazaka/nano_template)

text template like erb that can be used with opal

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nano_template'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nano_template

## Usage

```ruby
require 'nano_template'
require 'ostruct'

nano_template = NanoTemplate.new
proc = nano_template.template("<%= foo %>bar")
stash = OpenStruct.new({foo: 42})
p proc.call(stash) # "42bar"
```

## API

[API Document](http://www.rubydoc.info/github/Narazaka/nano_template)

## License

This is released under [MIT License](http://narazaka.net/license/MIT?2016).
