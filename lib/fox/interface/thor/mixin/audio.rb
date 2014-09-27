#!/usr/bin/env ruby


# System
require 'taglib'
require 'progressbar'


# @module       module Mixin
# @brief        Mixin module contains various functions to be used in other components
module Mixin

  # @module     Audio Module
  # @brief      Module wrapper around audio tasks
  module Audio

    # @fn       def initialize *args {{{
    # @brief    Default constructor
    #
    # @param    [Array]     args      Argument array
    def initialize *args
      super
    end # }}}

    # @fn       def play_remote url {{{
    # @brief    Play audio content from remote URL
    #
    # @param    [String]      url     Remote URL
    def play_remote url
      play( url, :url )
    end # }}}

    # @fn       def play_local file {{{
    # @brief    Play audio content file
    #
    # @param    [String]      file      Filename incl. path
    def play_local file

      duration = get_duration( file ) # in sec

      if( duration.nil? )
        play( file, :file )
      else

        threads     = []

        threads     <<  Thread.new { play( file, :file ) }
        threads     <<  Thread.new do
          ProgressBar.new( "Pomodoro", duration.to_i ) do |bar|
            duration.to_i.times { sleep(1); bar.inc }
          end
        end

        threads.each { |thread| thread.join }

      end # if( duration.nil? )

    end # }}}


    private

    # in sec
    def get_duration file

      duration = nil

      begin
        TagLib::FileRef.open( file ) do |fileref|

          unless fileref.null?
            tag         = fileref.tag
            properties  = fileref.audio_properties

            duration    = properties.length
          end

        end # of TagLib
      rescue
      end

      return duration
    end


    def play identifier, type

      # Check if we are able to playback
      sanity_check

      if( type == :url )
        # FIXME: Caching!
        `wget #{identifier} -O - | mplayer -really-quiet -cache 8192 -`
      end

      if( type == :file )
        `mplayer -really-quiet #{identifier}`
      end

    end

    def sanity_check 
      players = detect_available_players
      # FIXME
    end

    # sorted after user preference
    def detect_available_players
      # FIXME
      [ "mplayer" ]
    end

  end # of module Audio

end # of module Mixin


# vim:ts=2:tw=100:wm=100:syntax=ruby
