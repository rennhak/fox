#!/usr/bin/env ruby

# Standard includes
require 'bundler'
require 'thor'
require 'rake'
require 'ruby-try'


# @module         module Fish
# @brief          Fish modules and classes namespace
module Fox

    require_relative 'fox/version'
    require_relative 'fox/error'

    # @module     module Mixin
    # @brief      Mixin module contains various functions to be used in other components
    module Mixin

        # autoload :Guess, 'fox/mixin/'

    end # of module Mixing

    # autoload :Cache,      'fish/library/cache'
    # autoload :Choice,     'fish/library/choice'


    DEFAULT_CONFIG      = '.fox/config.yaml'.freeze

    class << self
    end # of class << self

end # of module Fox

Default.start

# vim:ts=2:tw=100:wm=100:syntax=ruby
