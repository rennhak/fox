#!/usr/bin/env ruby

# System
require "thor"

# Custom
require File.expand_path(File.dirname(__FILE__) + '/interface/thor/version')
require File.expand_path(File.dirname(__FILE__) + '/interface/thor/configuration')
require File.expand_path(File.dirname(__FILE__) + '/interface/thor/pomodoro')
require File.expand_path(File.dirname(__FILE__) + '/interface/thor/new')
require File.expand_path(File.dirname(__FILE__) + '/interface/thor/info')


module Fox

  # @class  Fox CLI Class
  # @brief  Implements the Fox CLI interface
  class Cli < Thor

    include Thor::Actions

    package_name "Fox"

    register Pomodoro, "pomodoro", "pomodoro [options]", "Pomodoro clock to help you concentrate"
    tasks["pomodoro"].options  = Pomodoro.class_options

    register New, "new", "new [options]", "Create new paper project"
    tasks["new"].options = New.class_options

    register Info, "info", "info [options]", "Show information about Fox and its environment"
    tasks["info"].options    = Info.class_options

    register Configuration, "configuration", "configuration [options]", "Handle global and directory local configurations"
    tasks["configuration"].options    = Configuration.class_options

  end # of Class Cli

end # of Module Fox

#class CLI < Thor
#  register(Version, 'version', 'version [something]', "Show current version")
#  register(Configuration, 'config', 'config [something]', "Type for work with fox config")
#  register(Pomodoro, 'pomodoro', 'pomodoro [something]', "Pomodoro clock to help you concentrate")
#  register(New, 'new', 'new [something]', "Bookstrap new scientific paper project")
#
#end
#
