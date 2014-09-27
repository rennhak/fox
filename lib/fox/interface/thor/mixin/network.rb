#!/usr/bin/env ruby


# System


# @module       module Mixin
# @brief        Mixin module contains various functions to be used in other components
module Mixin

  # @module     Network Module
  # @brief      Module wrapper around network tasks
  module Network

    # @fn       def initialize *args {{{
    # @brief    Default constructor
    #
    # @param    [Array]     args      Argument array
    def initialize *args
      super
    end # }}}

    # @fn     def online? {{{
    # @brief  Checks if user is online so we can download assets
    #
    # @return [boolean]     True if online, otherwise false
    def online?

      begin
        true if open( "http://www.google.com/", { read_timeout: 5 } )
      rescue
        false
      end

    end # }}}

  end # of module Network

end # of module Mixin


# vim:ts=2:tw=100:wm=100:syntax=ruby
