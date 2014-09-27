#!/usr/bin/env ruby

# System includes
require 'thor'
require 'data_mapper' 
require 'dm-migrations'
require 'fileutils'

# Custom includes
require File.expand_path( File.dirname( __FILE__ ) + '/mixin/default' )
require File.expand_path( File.dirname( __FILE__ ) + '/mixin/logger' )
require File.expand_path( File.dirname( __FILE__ ) + '/mixin/history' )
require File.expand_path( File.dirname( __FILE__ ) + '/mixin/model' )
require File.expand_path( File.dirname( __FILE__ ) + '/mixin/default_model' )
require File.expand_path( File.dirname( __FILE__ ) + '/mixin/database' )


# @class      class Init < Thor
# @brief      Initializes project default config environment
class Init < Thor

  # Include various partials
  include ::Mixin::Default
  include ::Mixin::Logger
  include ::Mixin::Database

  default_task :init

  # @fn       def init # {{{ 
  # @brief    initialize project, create database for project
  desc 'init', 'initialize project' 
  option :force, :aliases => :f
  def init

    path_to_db_folder   = "#{Dir.pwd}/.fox"
    db_path             = "#{path_to_db_folder}/#{default_db_name}"

    # if database exist need stop
    abort("(EE) Found $PWD/.fox - Project already initialized, aborting") if( File.exist?(db_path) && !options['force'] )

    FileUtils.mkdir_p("#{path_to_db_folder}")

    DataMapper.setup(:default, %Q(sqlite:///#{db_path}))
    DataMapper.auto_migrate!
    DataMapper.finalize

    puts "(II) Project initialized"
  end # of def init }}}

  private 
    def default_db_name
      "fox.db"
    end

end # if class Init

# vim:ts=2:tw=100:wm=100:syntax=ruby
