# Fox
Version 0.0.1-1-g385406b

[![Gem Version](https://badge.fury.io/rb/fox.svg)](http://badge.fury.io/rb/fox)
[![License](http://img.shields.io/badge/license-GPLv3-brightgreen.svg)](http://img.shields.io/badge/license-GPLv3-brightgreen.svg)

Fox [1] is a complete solution for scientific paper scaffolding, tooling and author support.  It
allows the bootstrapping or generation of dummy default paper with a rails scaffold like commandline
tool.

Fox supports the configuration of various methods of pdf push to remote locations to allow for
efficient file sharing with co-authors.


Fox, supports currently the following international journals:

 - None, TBD

Fox, supports currently the following international conferences:

 - IEEE Robotics & Automation Society (ICRA) [2]

Fox, supports currently the following domestic conferences:

 - None, TBD


[1] Paper Fox, named after an in similar spirit deviation from the german "papier tiger"
[2] IEEE Robotics and Automation Society's flagship conference,  IEEE Robotics & Automation Society, http://icra2015.org/


## Installing

By running gem comand

```
gem install fox
```

or by adding to `Gemfile`

```ruby
gem 'fox', git: 'https://github.com/rennhak/fox'
```

## Usage

As library


```ruby
2.1.2 :001 > require 'fox'
 => true
```

or from the command line

```sh
~# fox

Commands:
  fox generate
```

## Contributing

1. Fork it ( https://github.com/rennhak/fox/fork )
2. Create your feature branch (`git checkout -b my_new_feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my_new_feature`)
5. Create a new Pull Request


## Authors

* [Bjoern Rennhak](https://github.com/rennhak)

## Copyright & License

Please refer to the COPYING.md and LICENSE.md file.
