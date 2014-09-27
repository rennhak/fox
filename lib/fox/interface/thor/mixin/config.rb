#!/usr/bin/env ruby


# System
require 'fileutils'
require 'ostruct'


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

      # Store all config paths and relevant filenames (global)
      @paths                     = OpenStruct.new

      # Level 1
      @paths.user_home           = Dir.home
      @paths.fox_home            = options[:'config-path']

      # Level 2
      @paths.assets              = File.join( @paths.fox_home, 'assets' )
      @paths.databases           = File.join( @paths.fox_home, 'databases' )

      # Level 3
      @paths.pomodoro_assets     = File.join( @paths.assets, 'pomodoro' )
      @paths.coffeeshop_assets   = File.join( @paths.assets, 'coffeeshop' )

      # Sanity check, create if doesn't exist in $HOME
      @paths.to_h.each do |tag, uri|
        FileUtils.mkdir_p( uri ) unless( File.exists?( uri ) )
      end

      # Remote Assets URLs
      @urls                      = OpenStruct.new

      @urls.pomodoro_5_mp3       = ''
      @urls.pomodoro_25_mp3      = ''

      @urls.coffeeshop_mp3       = ''


    end # }}}

    Thor::class_option :'config-path', :type => :string, :required => false, :default => "#{Dir.home}/.fox", :desc => 'Change default config path'

  end # of module Configuration

end # of module Mixin


# vim:ts=2:tw=100:wm=100:syntax=ruby
