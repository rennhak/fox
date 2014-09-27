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
  include ::Mixin::Network

  # class_option :'ieee-icra',  :type => :boolean, :desc => "IEEE Robotics & Automation Society (ICRA)", :default => false

  # @fn       
  # @brief    
  desc "run", "Starts Pomodoro clock"
  def tick
    
  end # }}}

  private

  no_tasks do
  end # of no_tasks do

end # of Class New


# vim:ts=2:tw=100:wm=100:syntax=ruby
