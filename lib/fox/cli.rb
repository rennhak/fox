#!/usr/bin/env ruby

# System
require "thor"

# Custom
require File.expand_path(File.dirname(__FILE__) + '/interface/thor/version')
require File.expand_path(File.dirname(__FILE__) + '/interface/thor/configuration')
require File.expand_path(File.dirname(__FILE__) + '/interface/thor/pomodoro')
require File.expand_path(File.dirname(__FILE__) + '/interface/thor/new')


class CLI < Thor

  register(Version, 'version', 'version [something]', "Show current version")
  register(Configuration, 'config', 'config [something]', "Type for work with fox config")
  register(Pomodoro, 'pomodoro', 'pomodoro [something]', "Pomodoro clock to help you concentrate")
  register(New, 'new', 'new [something]', "Bookstrap new scientific paper project")

end

