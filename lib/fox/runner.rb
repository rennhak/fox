#!/usr/bin/env ruby


# Custom
require_relative 'cli'


# @module   Fox Module
# @brief    Implements the Fox application
module Fox

  # @class  Fox Runner Class
  # @brief  Allow everything to be injected while defaulting to normal implementations.
  class Runner

    # @fn       def initialize {{{
    # @brief    Construct the entry point with the signature needed for injection.
    #
    # @param    [Array]         argv
    # @param    [IO]            stdin
    # @param    [IO]            stdout
    # @param    [IO]            stderr
    # @param    [Kernel]        kernel
    def initialize argv, stdin = STDIN, stdout = STDOUT, stderr = STDERR, kernel = Kernel
      @argv, @stdin, @stdout, @stderr, @kernel = argv, stdin, stdout, stderr, kernel
    end # }}}

    # @fn       def execute! {{{
    # @brief    Run our normal Thor app the way we know and love.
    def execute!
      exit_code = begin
        # Thor accesses these streams directly rather than letting them be injected, so we replace them.
        $stderr = @stderr
        $stdin  = @stdin
        $stdout = @stdout

        # Fox::Cfg.load_configuration!
        Fox::Cli.start(@argv)

        # Thor::Base#start does not have a return value, assume success if no exception is raised.
        0
      rescue Exception => e
        # Proxy any exception that comes out of Thor itself back to stderr.
        $stderr.write(e.message + "\n")

        # Exit with a failure code.
        1
      ensure
        # ...then we put them back.
        $stderr = STDERR
        $stdin  = STDIN
        $stdout = STDOUT
      end

      # Proxy our exit code back to the injected kernel.
      @kernel.exit(exit_code)
    end # }}}

  end # of Class Runner

end # of Module Fox

# vim:ts=2:tw=100:wm=100:syntax=ruby
