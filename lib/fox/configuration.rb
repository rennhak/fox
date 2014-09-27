#!/usr/bin/env ruby

# System
require "yaml"


module Fox

  # @class      Configuration  
  # @brief      Configuration control class
  class Configuration

    attr_accessor :project_name
    attr_accessor :base_dir

    # @fn         def initialize confguration_file # {{{
    # @brief      Constructor for Configuration class
    #
    # @param      [String] - path to configuration file 
    def initialize confguration_file = nil
      configuration = if confguration_file
        base_configuration.merge(YAML.load_file(confguration_file))
      else
        base_configuration
      end

      # @todo add a deep loop for inner key-value pair
      configuration.each do |key, value|
        # if Default configuration not contain property, then we should raise exception
        raise Exception.new("Unexpected #{key} for Fox configuration") unless base_configuration.include?(key)
        instance_variable_set(:"@#{key}", value)
      end
    end # of def initialize }}}

    # @fn         def base_configuration {{{
    # @brief      return default configuration for Fox
    # @return     [Hash] 
    def base_configuration 
      {
        "project_name" => "project-#{rand(100)}",
        "base_dir"     => Dir.pwd
      } 
    end # of def base_configuration }}}

  end # end of Configure class

end # end of Fox module

