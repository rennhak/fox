#!/usr/bin/env ruby

# System
require 'open-uri'

# Custom includes
require File.expand_path( File.dirname( __FILE__ ) + '/mixin/logger' )
require File.expand_path( File.dirname( __FILE__ ) + '/mixin/config' )
require File.expand_path( File.dirname( __FILE__ ) + '/mixin/network' )
require File.expand_path( File.dirname( __FILE__ ) + '/mixin/audio' )


# @class  Pomodoro command class
# @brief  Allows you to get more productivity with a ticking egg timer
class Pomodoro < Thor

  # Include various traits
  include Thor::Actions
  include ::Mixin::Logger
  include ::Mixin::Config
  include ::Mixin::Network
  include ::Mixin::Audio

  class_option :stream,   :type => :boolean, :desc => 'Stream from github.com remote', :default => false
  class_option :download, :type => :boolean, :desc => 'Download from github.com remote', :default => true

  # @fn       
  # @brief    
  desc 'run', 'Starts Pomodoro clock'
  def tick

    @logger.message :debug, 'Running sanity check for Pomodoro task'
    sanity_check

    if( options[:stream] ) 
      @logger.message :info, 'Streaming from Remote via github.com raw (use CTRL+C to abort)'
      @logger.message :warning, 'Please do not hammer github.com, download if possible instead'

      play_remote( @urls.pomodoro.send( @config.pomodoro.default ) )
    else
      @logger.message :info, 'Playing local file (use CTRL+C to abort)'

      play_local( @assets.pomodoro.send( @config.pomodoro.default ) )
    end

  end # }}}


  private

  no_tasks do

    # @fn       def sanity_check {{{
    # @brief    Performs sanity check on online status and required assets
    def sanity_check

      # Either we stream or we use download / cached version
      if( options[:stream] )
        raise ArgumentError, 'Need to have access to Internet to be able to stream' unless( online? )
      else
        # Download needed?
        broken = check_assets

        unless( broken.empty? )
          raise ArgumentError, "Need to have access to Internet to be able to download missing assets" unless( online? )

          # Download!
          broken.each do |type|
            @logger.message :trace, "Downloading missing pomodoro asset (#{type})"
            download @urls.pomodoro.send( type ), @assets.pomodoro.send( type )
          end # of broken.each

        end # of unless broken.empty?
      end # of if( options[:stream] )

    end # of def sanity_check }}}

    # @fn       def check_assets {{{
    # @brief    Checks local assets for pomodoro task, and if missing returns array with missing keyword
    #
    # @return   [Array]     Returns array with missing keywords, e.g. "short", "normal"
    def check_assets
      broken = []

      %w[short normal].each do |type|
        broken << type unless( File.exist?( @assets.pomodoro.send( type ) ) )
      end # of %w[]

      broken
    end # def check_assets }}}

  end # of no_tasks do

end # of Class New


# vim:ts=2:tw=100:wm=100:syntax=ruby
