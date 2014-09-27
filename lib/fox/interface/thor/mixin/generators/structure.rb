#!/usr/bin/env ruby

#!/usr/bin/env ruby


module Mixin

  # @module     module Generators
  # @brief      Default Namespace for all Generators
  module Generators

    # @class      class Structure
    # @brief      map thrift structure to ruby class
    class Structure

      # @attribute [w] - structure_name [Symbol] from generated ruby code
      # @attribute [w] - params [Hash] with types and names of params arguments
      # @attribute [w] - structure type
      attr_accessor :structure_name, :params, :type

      # @fn         def initialize structure_name, params {{{
      # @brief      Structure constructor
      #
      # @param      [Symbol]  type                Type of Structure (class, enum)
      # @param      [String]  structure_name      Name for structure
      # @param      [Hash]    params              Fields for user defined structure
      def initialize type, structure_name, params
        @type = type
        if @type == :class 
          raise RuntimeException.new("Params for #{structure_name} empty") if params.size == 0
          @structure_name, @params = structure_name, params
        else 
          @structure_name = structure_name
        end
      end # def initialize }}}

    end # of class Structure
  end # of module Generators
end # of module Mixin

# vim:ts=2:tw=100:wm=100:syntax=ruby
