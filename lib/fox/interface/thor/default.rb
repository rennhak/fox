#!/usr/bin/env ruby

# System include
require 'thor'
require 'data_mapper'

# Custom include
require File.expand_path( File.dirname( __FILE__ ) + '/mixin/default' )
require File.expand_path( File.dirname( __FILE__ ) + '/mixin/logger' )
require File.expand_path( File.dirname( __FILE__ ) + '/mixin/database' )
require File.expand_path( File.dirname( __FILE__ ) + '/version' )

# @class      class Default
# @brief      work with user Structures
class Default < Thor

  # Include various partials
  include ::Mixin::Default
  include ::Mixin::Logger
  include ::Mixin::Database

  default_task :set

  # @fn         def set version {{{
  # @brief      set default Model for work
  # 
  # @param      [String] - version number
  desc "set MODEL VERSION", "set default MODEL and VERSION for work"
  def set model, version = nil 
    @logger.message :info, "Running Fox #default for #{model}"

    models = all_models.map(&:name)
    if models.map(&:downcase).include?(model.downcase)
      set_default_model model
      @logger.message :info, "Set '#{model.to_s.capitalize}' model as default Structure for work"

      if version
        Version.new.set(version)
      end

    else
      abort(%Q(Model '#{model.capitalize}' not found.\n Available models:\n#{models.sort.join("\n")}))  
    end  
  end # of def set # }}}

  # @fn         def now {{{
  desc "now", "return default Model"
  def now 
    @logger.message :info, "Running Fox Default#now"
    default_model = get_default_model
    
    if default_model.nil? 
      puts "Default model not set"
      puts "Set with `fox default set <ModelName>`"
    else
      version = if default_model.version.nil?
        "\nversion not defined. Define with `fox version set <Version>`"
      else
        "version: #{default_model.version}"
      end
      puts "Default Model: #{default_model.name} #{version}"
    end
  end # of def now 

end # of class Default


