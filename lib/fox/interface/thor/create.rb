#!/usr/bin/env ruby

# System include
require 'thor'

# Custom include
require File.expand_path( File.dirname( __FILE__ ) + '/mixin/default' )
require File.expand_path( File.dirname( __FILE__ ) + '/mixin/logger' )

# require File.expand_path(File.dirname(__FILE__) + '/mixin/generators/java_generator')


# @class      class Create
# @brief      Generate scaffolded output
class Create < Thor

  # Include various partials
  include ::Mixin::Default
  include ::Mixin::Logger

  default_task :create

  GENS = Mixin::Generators

  # # @fn         def create file {{{
  # # @brief      FIXME
  # #
  # desc "create FOLDER", "generate from thrift `FILE` a template for `languages`, and write result into `output` directory (gen-* packages)"
  # option :output, :aliases => :o, :type => :string, :default => Dir.pwd
  # option :version, :aliases => :v, :type => :string, :default => "0.0.1"
  # option :java

  # def create file
  #   @logger.message :info, "Running Fox #create for #{file.to_s}"
  #   
  #   output  = options["output"]
  #   version = options["version"]
  #   
  #   langs   = options.keys & languages
  #   
  #   langs.each do |lang|
  #     klass = Object.const_get("#{GENS}::JavaGenerator")
  #     klass.generate( file, version, output )
  #   end
  # end # def create # }}}

end # of class CreateCommand

# vim:ts=2:tw=100:wm=100:syntax=ruby
