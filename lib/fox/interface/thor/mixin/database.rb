# System includes
require 'data_mapper'

# Custom includes
require File.expand_path( File.dirname( __FILE__ ) + '/history' )
require File.expand_path( File.dirname( __FILE__ ) + '/model' )
require File.expand_path( File.dirname( __FILE__ ) + '/default_model' )

# @module     module Mixin
# @brief      Mixin module contains various functions to be used in other components
module Mixin

  # @module   Database Module
  # @brief    Module wrapper around database tasks
  module Database
    extend self

    DataMapper.setup(:default, %Q(sqlite:///#{Dir.pwd}/.fox/fox.db))

    # @fn         def write command # {{{ 
    # @brief      save command in database
    #
    # @param      [String]    command - command name
    #
    # @param      [Array]    arguments - arguments for command
    def add_command command, *arguments
      history = History.new
      history.command = command
      history.arguments = arguments.join(" ")
      history.save 
    end # of def write }}}

    # @fn         def add_model model_name, version, uuid # {{{
    # @brief      save Model into database
    # 
    # @param      [String]  model_name - name of Structure
    #
    # @param      [String]  version    - version of Structure
    #
    # @param      [String]  uuid       - uuid of Structure  
    def add_model model_name, version, uuid 
      model = Model.new
      model.name    = model_name
      model.version = version
      model.uuid    = uuid
      
      model.save
    end # of def add_model }}}

    # @fn         def set_default_model model_name # {{{ 
    # @brief      Set default Model for usage 
    #
    # @param      [String] - model_name - name of Structure
    def set_default_model model_name
      # clear all models, when set default
      DefaultModel.destroy!
      default_model = DefaultModel.new
      default_model.name = model_name
      default_model.save
    end # of set_default_model }}}

    # @fn         def get_default_model # {{{  
    # @brief      return current default model
    def get_default_model
      DefaultModel.first
    end # of def get_default_model }}}

    # @fn         def clear_default_model # {{{
    # @brief      remove default model
    def clear_default_model
      DefaultModel.destroy!
    end # of def clear_default_model # }}}

    # @fn         def set_default_model_version version # {{{ 
    # @brief      Set default Model version for usage 
    #
    # @param      [String] - model_name - version of Structure
    def set_default_model_version version
      default_model = DefaultModel.first
      default_model.version = version
      model = Model.all(:conditions => { :name => default_model.name, :version => version}).first
      #should save with uuid
      default_model.uuid = model.uuid 
      default_model.save
    end # of def set_default_model_version }}}

    # @fn         def all_models {{{
    # @brief      Get all Models in database
    # 
    def all_models 
      Model.all
    end # of def all_models }}}
    
    # @fn         def check_if_version_available_for_model model, version # {{{ 
    # @brief      check if model exist with given version
    #
    # @param      [String] model - model name
    # 
    # @param      [String] version - version number
    #
    # @return     [Boolean] true, when model exist, otherwise - false 
    def check_if_version_available_for_model model, version 
      model = Model.all(:conditions => { :name => model, :version => version}).first
      if model.nil?
        false
      else
        true
      end  
    end # of def check_if_version_available_for_model }}}

    # @fn         def default_model_defined? # {{{
    # @brief      check if model name for default is set
    #
    # @return     [Boolean] true, when defined 
    def default_model_defined? 
      default_model = DefaultModel.first
      if default_model.nil?
        false 
      else 
        true 
      end    
    end # of def default_model_defined? # }}}

  end # of Module Database

end # of module Mixin


# vim:ts=2:tw=100:wm=100:syntax=ruby
