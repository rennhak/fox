#!/usr/bin/env ruby

# require 'fox/error/errors'

module Mixin

  # @module     module Generators
  # @brief      Default Namespace for all Generators
  module Generators
    # @module      TemplateLoader
    # @brief       module for load template for target language
    module TemplateLoader

      extend self

      # default template directory
      TEMPLATE_DIR = 'template'

      # @fn         def load language {{{
      # @brief      Load template for target language
      #
      # @param      [String]    Target language
      #
      # @return     [String]    Result template source
      def load language
        file = templates.find { |file| File.basename(file).start_with?(language) }

        raise Fox::LoadTemplateError.new("Template for #{language} not found") if file.nil?

        File.read(file)
      end

      # of def load }}}

      # @fn         def templates {{{
      # @brief      Get list of all templates from `TEMPLATE_DIR`
      #
      # @return     [Array<String>]   List of all templates
      def templates
        path = File.expand_path( File.dirname( __FILE__ ) + '../../../../../')
        Dir["#{path}/#{TEMPLATE_DIR}/*_template.erb"]
      end # of def templates }}}

    end # of module TemplateLoader
  end # of module Generators
end # of Mixin

# vim:ts=2:tw=100:wm=100:syntax=ruby
