#!/usr/bin/env ruby


# @module       module Mixin
# @brief        Mixin module contains various functions to be used in other components
module Mixin

  # @module     Config Module
  # @brief      Module wrapper around tasks which demands config file
  module Config

    # @fn       def initialize *args {{{
    # @brief    Default constructor
    #
    # @param    [Array]     args      Argument array
    def initialize *args

      super

      @config_path = options[:'config-path']

    end # }}}

    Thor::class_option :'config-path', :type => :string, :required => false, :default => "#{Dir.home}/.fox", :desc => 'Change default config path'

  end # of module Configuration

end # of module Mixin


# vim:ts=2:tw=100:wm=100:syntax=ruby
