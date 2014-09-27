#!/usr/bin/env ruby

# System includes
require 'fileutils'
require 'tmpdir'

# Custom include
require File.expand_path( File.dirname( __FILE__ ) + '/template_loader' )


module Mixin

  # @module     module Generators
  # @brief      Default Namespace for all Generators
  module Generators

    # @module      module BaseGenerator
    # @brief       Contain shared methods which will be used in other Generators
    module BaseGenerator

      # @fn         def load_template language {{{ 
      # @brief load template for target language
      #
      # @param [String] - target language
      #
      # @return [String] - loaded template for target language
      def load_template language  
        TemplateLoader.load(language)
      end # def load_template }}}

    end # of module BaseGenerator
  end # of module Generators
end # of module Fox

# vim:ts=2:tw=100:wm=100:syntax=ruby
