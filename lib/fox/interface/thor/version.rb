#!/usr/bin/env ruby

# Custom includes
require File.expand_path( File.dirname(__FILE__) + '../../../version' )
require File.expand_path( File.dirname( __FILE__ ) + '/mixin/logger' )
require File.expand_path( File.dirname( __FILE__ ) + '/mixin/database' )

# @class  Server command class
# @brief  Implements the server command
class Version < Thor

  default_task :show

  include ::Mixin::Logger
  include ::Mixin::Database

  ## API

  # @fn       def show {{{
  # @brief    Show version string of app
  desc 'show', 'Show version of this app'
  def show
    version = Fox::VERSION
    puts version
  end # }}}


  # @fn       def set version {{{ 
  # @brief    Set Version for default Model
  desc 'set VERSION', 'Set Version for default Model'
  def set version

    @logger.message :info, "Running Fox Version #set for #{version}"

    abort("Default model not defined! Run `fox default <ModelName>` for set default model") if !default_model_defined? 

    current_default_model = get_default_model

    if ! ( check_if_version_available_for_model current_default_model.name, version )
      available_versions = all_models.find_all do |model|
        model.name == current_default_model.name
      end.map(&:version).join("\n")  
      abort("Not Found #{version} for #{current_default_model.name}. Available Versions for #{current_default_model.name}:\n#{available_versions}")
    end

    set_default_model_version version
    @logger.message :info, "Set Default Version #{version} for #{current_default_model.name}"
  end # end of set }}}

  no_tasks do

    ## Actions

  end # of no_tasks do

end # of Class Version


# vim:ts=2:tw=100:wm=100:syntax=ruby
