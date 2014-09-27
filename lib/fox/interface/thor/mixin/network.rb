#!/usr/bin/env ruby


# System
require 'open-uri'
require 'net/http'
require 'net/ftp'
require 'uri'
require 'progressbar'
require 'date'
require 'tempfile'
require 'timeout'



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

    # @fn       def online? {{{
    # @brief    Checks if user is online so we can download assets
    #
    # @return   [boolean]     True if online, otherwise false
    def online?

      begin
        true if open( "http://www.google.com/", { read_timeout: 5 } )
      rescue
        false
      end

    end # }}}

    # @fn       def download url, target_filename # {{{
    # @brief    The function get retrieves the given URL content and returns it to the caller
    #
    # @param    [String]      url     Requires a string containing a uri which will be downloaded.
    #
    # @return   [OpenStruct]          Returns an OpenStruct containing content and many other meta information
    def download url, target_filename, progress_indicator = true

      # Pre-condition
      raise ArgumentError, "The function expects a string, but got a (#{url.class.to_s})" unless( url.is_a?(String) )

      # Main
      content                       = OpenStruct.new
      request                       = nil

      begin
        # wait 900s or 15min before timeout
        status = Timeout::timeout( 900 ) {

          if( progress_indicator )

            # Inspired by http://www.ruby-doc.org/stdlib-1.9.3/libdoc/open-uri/rdoc/OpenURI/OpenRead.html
            pbar    = nil
            request = open( url, 
                        "r", 
                        :read_timeout => nil,
                        :content_length_proc => lambda {|t|
                          if( t && 0 < t )
                            pbar = ProgressBar.new("...", t)
                            pbar.file_transfer_mode
                          end
                        },
                        :progress_proc => lambda {|s|
                          pbar.set s if pbar
                        }
                      )

          else
            request                 = open( url, "r", :read_timeout => nil )
          end

          STDOUT.puts ""

        } # end of Timeout::timeout
      rescue Timeout::Error
        puts 'Time out error - That took too long (>=15min) - fatal abort'
        exit
      end

      content.url                   = url
      content.content               = request.read
      content.content_type          = request.content_type
      content.charset               = request.charset
      content.content_encoding      = request.content_encoding
      content.last_modified         = request.last_modified
      content.date                  = DateTime.now

      @logger.message :debug, "Writing content to (file, #{target_filename.to_s})"
      File.open( target_filename, "w+" ) { |f| f.write( content.content ) }

      # Post-condition
      raise ArgumentError, "Result should be of type OpenStruct, but is (#{content.class.to_s})" unless( content.is_a?(OpenStruct) )

      [ content, target_filename ]
    end # }}}

  end # of module Network

end # of module Mixin


# vim:ts=2:tw=100:wm=100:syntax=ruby
