#!/usr/bin/env ruby

# Standard includes
require 'bundler'
require 'thor'
require 'rake'
require 'ruby-try'


require_relative "fox/runner"
require_relative "fox/version"

# Load all Thor/Rake file tasks
#Dir.glob( "fox/interface/thor/**/*.{thor,rb}" ) { |name| Thor::Util.load_thorfile name }
#Dir.glob( "fox/interface/rake/**/*.{rake,rb}" ) { |name| load name }


# # @module         module Fox
# # @brief          Fox modules and classes namespace
# module Fox
# 
#   require_relative 'fox/version'
#   # require_relative 'fox/error'
# 
#   # # @module     module Mixin
#   # # @brief      Mixin module contains various functions to be used in other components
#   # module Mixin
# 
#   #   # autoload :Guess, 'fox/mixin/'
# 
#   # end # of module Mixing
# 
#   # autoload :Cache,      'fox/library/cache'
#   # autoload :Choice,     'fox/library/choice'
# 
#   # class << self
#   # end # of class << self
# 
# end # of module Fox
# 
# # Default.start

# vim:ts=2:tw=100:wm=100:syntax=ruby
