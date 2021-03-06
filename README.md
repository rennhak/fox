# Fox
Version 0.0.2-2-g78e0147

[![Gem Version](https://badge.fury.io/rb/fox.svg)](http://badge.fury.io/rb/fox)
[![License](http://img.shields.io/badge/license-GPLv3-brightgreen.svg)](http://img.shields.io/badge/license-GPLv3-brightgreen.svg)


## WHAT IS THE FOX PROJECT?

Fox [1] is a complete solution for scientific paper scaffolding, tooling and author support.  It
allows the bootstrapping or generation of dummy default paper with a rails scaffold like commandline
tool.

Fox supports the configuration of various methods of pdf push to remote locations to allow for
efficient file sharing with co-authors.

Fox, currently supports only IEEE Robotics & Automation Society (ICRA) [2].

[1] Paper Fox, named after an in similar spirit deviation from the german "papier tiger"
[2] IEEE Robotics and Automation Society's flagship conference,  IEEE Robotics & Automation Society, http://icra2015.org/


## FEATURES

- Application
  - Ruby VM (2.1 or better)
- Feature Providing Base Libraries
  - RVM
  - Bundler
  - Datamapper ORM with SQLite3/MySQL
  - Slim
  - Various Gems (see Gemfile)
- Development
- Development Base Libraries
  - Rake
  - Thor
- Code Quality
  - Code review
  - Yard & related  (gem install yard --no-ri --no-rdoc ; gem install rdiscount --no-ri --no-rdoc)
  - Minimal controllers, delegated to proper Ruby classes
  - Logic free view templates
  - Proper Ruby OOP for base functionality
  - MetricFu/RSpec/Cucumber/DBC/Vagrant/Docker/i18n


## ON WHAT HARDWARE DOES IT RUN?

This Software was originally developed and tested on 32-bit x86 / SMP based PCs running on
Gentoo GNU/Linux 3.12.x. Other direct Linux and Unix derivates should be viable too as
long as all dynamical linking dependencys are met.


## DOCUMENTATION

A general developers API guide can be extracted from the Yardoc subdirectory which is able to
generate HTML as well as PDF docs. Please refer to the [Rake|Make]file for additional information
how to generate this documentation.

## INSTALLING

By running gem comand (stable version)

```
gem install fox
```

or by adding to `Gemfile` (unstable version)

```ruby
gem 'fox', git: 'https://github.com/rennhak/fox', branch: 'develop'
```

## USAGE

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

## DEVELOPMENT

Get a copy of current source from SCM

```sh
~# git clone https://github.com/rennhak/fox
```

Install system dependencies (e.g. Debian/GNU)

```sh
~# apt-get install iconv
~# apt-get install imagemagick libmagickcore-dev libmagickwand-dev libmagic1 libmagic-dev
~# apt-get install curl screen less vim
~# apt-get install zlib1g zlib1g-dev
```

Install RVM (may not apply)

```sh
~# curl -sSL https://get.rvm.io | bash -s stable
```

Make sure to follow install instructions and also integrate it also into your shell. e.g. for ZSH,
add this line to your .zshrc.

```sh
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" ;

or

~# echo "source /usr/local/rvm/scripts/rvm" >> ~/.zshrc

```

Create proper RVM gemset

```sh
~# rvm --create use 2.1.3@fox_project
```

Install Ruby VM 2.1.x or better

```sh
~# rvm install 2.1.3
```

Install libraries via bundler

```sh
~# gem install bundler
~# bundle
```

Development uses SQLite3

```sh
~# apt-get install sqlite3 libsqlite3-dev
```

### BUILDING GEM

```sh
~# rake build
```

### INSTALLING GEM

```sh
~# gem install pkg/fox-X.X.X.gem
```

### SUBMIT TO RUBYGEMS.ORG

```sh
~# cd pkg
~# gem push -V fox-X.X.X.gem
```

### CURRENTLY AVAILABLE RAKE TASKS

For a full list of Rake tasks suported, use `rake -T`.

rake build                  # Build fox-0.0.2.gem into the pkg directory
rake cucumber:pretty        # Run Cucumber features
rake cucumber:progress      # Run Cucumber features
rake default                # Show the default task when executing rake without arguments
rake docs:generate          # Generate Yardoc documentation for this project
rake docs:graph             # Generate Yard Graphs for this project
rake guard:default          # Execute Ruby Guard
rake help                   # Shows the usage help screen
rake install                # Build and install fox-0.0.2.gem into system gems
rake man:build              # Build the manual pages
rake man:clean              # Clean up from the built man pages
rake measurement:benchmark  # When executing rake tasks measure elapsed time, used with other tasks
rake measurement:profiling  # Run profiling over stack
rake metric:metric          # Run metric fu for project
rake package:clean          # Clean all files from pkg folder
rake readme:all             # Generate proper README file from templates
rake readme:subdirs         # Builds generates readme files in all sub-directories
rake readme:topdir          # Generate top level README file from template
rake release                # Create tag v0.0.2 and build and push fox-0.0.2.gem to Rubygems
rake spec                   # RSpec Core Tasks
rake todo                   # Look for TODO and FIXME tags in the code
rake version                # Git Tag number of this repo



### CURRENTLY AVAILABLE THOR TASKS

For a full list of Thor tasks suported, use `thor -T`.

default
-------
thor :build                  # build
thor :clean                  # clean
thor :default                # Show the default task when executing rake without arguments
thor :docs:generate          # Generate Yardoc documentation for this project
thor :docs:graph             # Generate Yard Graphs for this project
thor :guard:default          # Execute Ruby Guard
thor :help                   # Shows the usage help screen
thor :install                # Build and install fox-0.0.2.gem into system gems
thor :man:build              # Build the manual pages
thor :man:clean              # Clean up from the built man pages
thor :measurement:benchmark  # When executing rake tasks measure elapsed time, used with other tasks
thor :measurement:profiling  # Run profiling over stack
thor :metric:metric          # Run metric fu for project
thor :package:clean          # Clean all files from pkg folder
thor :readme:all             # Generate proper README file from templates
thor :readme:subdirs         # Builds generates readme files in all sub-directories
thor :readme:topdir          # Generate top level README file from template
thor :release                # release
thor :spec                   # Run RSpec code examples
thor :todo                   # Look for TODO and FIXME tags in the code
thor :version                # Git Tag number of this repo

info
----
thor info:overview  # Shows system overview

version
-------
thor version:show  # Show version of this app




## IF SOMETHING GOES WRONG

In case you enconter bugs which seem to be related to the package please check in
the MAINTAINERS file for the associated person in charge and contact him or her directly. If
there is no valid address then try to mail Bjoern Rennhak <bjoern AT clothesnetwork DOT com> to get
some basic assistance in finding the right person in charge of this section of the project.


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
