#!/usr/bin/env ruby

# System
require 'open-uri'

# Custom includes
require File.expand_path( File.dirname( __FILE__ ) + '/mixin/logger' )
require File.expand_path( File.dirname( __FILE__ ) + '/mixin/config' )


# @class  Pomodoro command class
# @brief  Allows you to get more productivity with a ticking egg timer
class Pomodoro < Thor

  # Include various partials
  include Thor::Actions
  include ::Mixin::Logger
  include ::Mixin::Config

  # class_option :'ieee-icra',  :type => :boolean, :desc => "IEEE Robotics & Automation Society (ICRA)", :default => false


  # @fn       def new projectname {{{
  # @brief    Generates new project with given PROJECTNAME
  # desc "generate PROJECTNAME", "Creates new project PROJECTNAME"
  # def generate projectname
  # end # }}}


  def run

  end

  private

  no_tasks do

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


  end # of no_tasks do

end # of Class New


# vim:ts=2:tw=100:wm=100:syntax=ruby
