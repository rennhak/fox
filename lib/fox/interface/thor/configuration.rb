#!/usr/bin/env ruby


# System includes
require "thor"
require 'fileutils'

#Custom includes
require File.expand_path(File.dirname(__FILE__) + '/mixin/default_config')
require File.expand_path(File.dirname(__FILE__) + '/mixin/configuration')

# @fn     class Generate < Thor
# @brief  Generate config files
class Configuration < Thor

  namespace :config 

  # Include various partials
  include Thor::Actions
  include ::Mixin::DefaultConfig


  desc "generate", "Generate fox config file" # {{{
  option :pretend, desc: "Pretend switch for Fox operations"

  def generate
    template_path   = File.expand_path(File.dirname(__FILE__) + '/../../template/config/config.tt') 
    source_paths    << template_path
    config          = defaults['fox'].merge(options)
    template(template_path, config_path, config)
  end # }}}

  # @fn         def config key, value {{{
  # @brief      set new `value` for `key`
  desc "config KEY VALUE", "Set `VALUE` for `KEY`"
  def config key, value

    Kernel.include Mixin::Configuration

    # othewise load config file if it contain current key change to new value
    current_configuration = YAML.load_file(config_path)

    namaspace = key.split(".")

    abort("Key '#{key}' not found in config") if namaspace.size == 1 || namaspace.size > 2
    abort("Key '#{key}' not found in config") if current_configuration[namaspace.first][namaspace.last].nil?

    current_configuration[namaspace.first][namaspace.last] = value

    File.open(config_path, "w") do |config|
      config.write(current_configuration.to_yaml)
    end

  end # of def config # }}}

  desc "clean", "Removes fox config file" # {{{
  def clean
    File.delete(config_path) if File.exist?(config_path)
  end # }}}

  private

    # @fn       def config_path {{{
    # @brief    Return path to configuration file
    def config_path
      File.expand_path('~/.fox/config.yml')
    end # def config_path # }}} 

end # of class Generate < Thor

# vim:ts=2:tw=100:syntax=ruby
