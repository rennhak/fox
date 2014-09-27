#!/usr/bin/env ruby

# System
require "thor"

# Custom
require File.expand_path(File.dirname(__FILE__) + '/interface/thor/version')
# require File.expand_path(File.dirname(__FILE__) + '/interface/thor/configuration')


class CLI < Thor

  register(Version, 'version', 'version [something]', "Show current version")
  # register(Configuration, 'config', 'config [something]', "Type for work with fish config")

end

