#!/usr/bin/env ruby

# Standard includes
require 'bundler'
require 'thor'
require 'rake'
require 'ruby-try'


# @class    Fox
# @brief    Provides complete solution for scientific authoring
class Fox

  # @fn       def initialize {{{
  # @brief    Default Constructor
  def initialize
  end # }}}

end # of module Fox

# Load other library files
Dir[ File.dirname(__FILE__) + '/fox/library/*.rb' ].each { |file| require file }


# vim:ts=2:tw=100:wm=100:syntax=ruby
