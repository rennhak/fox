#!/usr/bin/env ruby


# System includes
require 'ostruct'
require 'andand'
require 'tempfile'
require 'os'

# Custom includes
require File.expand_path( File.dirname( __FILE__ ) + '/mixin/shell' )


# @class  New command class
# @brief  Forks new paper projects
class New < Thor

  # Include various partials
  include Thor::Actions
  # include ::Mixin::Shell
  # include ::Mixin::Command

  # default_task :new


  # Different Conferences
  class_option :'ieee-icra',  :type => :boolean, :desc => "IEEE Robotics & Automation Society (ICRA)"


  ## API

  # @fn       def new foldername {{{
  # @brief    Main new task entry point
  desc "generate PROJECTNAME", "Creates new project PROJECTNAME"
  def generate projectname


    puts "Generate!"
    p projectname

  end # }}}


  private

  no_tasks do

  end # of no_tasks do

end # of Class New


# vim:ts=2:tw=100:wm=100:syntax=ruby
