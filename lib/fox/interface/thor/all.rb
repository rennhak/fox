#!/usr/bin/env ruby


# System include
require "thor"

# Custom include
require File.expand_path( File.dirname( __FILE__ ) + '/mixin/logger' )
require File.expand_path( File.dirname( __FILE__ ) + '/mixin/database' )

# @class      class All
# @brief      drop structure from Fox Service
class All < Thor

  # Include various partials
  include ::Mixin::Logger
  include ::Mixin::Database

  default_task :all

  # @fn         def all {{{
  desc "all", "Get all Models"
  option :force, :aliases => :f
  def all
    @logger.message :info, "Running Fox All command"
    all_models.sort_by(&:name).each do |model|
      puts "#{model.name} #{model.version} #{model.uuid}" 
    end  

  end # def all }}}

end # of class All

# vim:ts=2:tw=100:wm=100:syntax=ruby
