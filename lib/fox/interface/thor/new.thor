#!/usr/bin/env ruby


# System includes
require 'ostruct'
require 'andand'
require 'tempfile'
require 'os'

# Custom includes
require File.expand_path( File.dirname( __FILE__ ) + '/mixin/logger' )


# @class  New command class
# @brief  Forks new paper projects
class New < Thor

  # Include various partials
  include Thor::Actions
  include ::Mixin::Logger

  class_option :'ieee-icra',  :type => :boolean, :desc => "IEEE Robotics & Automation Society (ICRA)", :default => false


  # @fn       def new projectname {{{
  # @brief    Generates new project with given PROJECTNAME
  desc "generate PROJECTNAME", "Creates new project PROJECTNAME"
  def generate projectname

    @logger.message :info, "Generating project '#{projectname.to_s}' in folder './#{projectname.to_s}'"

    type            = select_type
    @logger.message :info, "Using #{type.to_s} type"

    template_path   = File.expand_path(File.dirname(__FILE__) + '/../../template/document/' + type.to_s )
    ProjectBuilder.load( type.to_s + ".fox" )

  end # }}}


  private

  no_tasks do

    # @fn     def select_type {{{
    # @brief  Checks selected type with user and returns value for further processing
    def select_type

      # Default containers
      type    = ""

      # Set if default switch given
      type    = "ieee-icra" if( options[:'ieee-icra'] )

      if type.empty?
        type  = ( yes?( "Use IEEE Robotics & Automation Society (ICRA) Template? [y/n]" ) ) ? ( 'ieee-icra' ) : ( '' )
      end

      # Post-condition check
      if type.empty?
        @logger.message :error, "Could not determine the type of document you want to generate"
        abort
      end

      return type
    end # }}}

  end # of no_tasks do

end # of Class New


# vim:ts=2:tw=100:wm=100:syntax=ruby
