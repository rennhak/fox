# File: fox.gemspec

# Make sure lib is in Load path
lib = File.expand_path( '../lib/', __FILE__ )
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?( lib )

# System includes
require 'date'

# Custom includes
require 'fox/version'

Gem::Specification.new do |spec|

  spec.name                 = 'fox'

  spec.description          = %q(Commandline interface and library to the Fox Scientific Paper Suite)
  spec.summary              = spec.description

  spec.authors              = [ 'Bjoern Rennhak' ]
  spec.email                = [ 'bjoern@clothesnetwork.com' ]

  spec.homepage             = 'http://github.com/rennhak/fox'

  spec.licenses             = %w[GPLv2]

  spec.date                 = DateTime.now.to_s.split( 'T' ).first
  spec.version              = Fox::VERSION
  spec.platform             = Gem::Platform::RUBY

  spec.metadata             = {
                                "issue_tracker" =>  "http://github.com/rennhak/fox"
                              }

  spec.bindir               = 'bin'
  spec.executables          = %w[fox]

  spec.require_paths        = %w[lib]

  spec.files                = %w[
                                  AUTHORS.md
                                  CHANGELOG.md
                                  COPYING.md
                                  LICENSE.md
                                  MAINTAINERS.md
                                  FAQ.md
                                  Gemfile
                                  README.md
                                  Rakefile
                                  .project.yaml
                                  fox.gemspec
                                ]

  spec.files                += Dir.glob( 'bin/**/*' )

  spec.files                += Dir.glob( 'lib/**/*.rb' )
  spec.files                += Dir.glob( 'lib/**/*.thor' )

  spec.files                += Dir.glob( 'spec/**/*' )

  # Exclude data folder (too big)
  # spec.files                += Dir.glob( 'data/**/*' )

  spec.files                += Dir.glob( 'documentation/**/*' )

  spec.files                += Dir.glob( 'examples/**/*' )

  spec.files                += Dir.glob( 'base/**/*' )

  spec.files                += Dir.glob( 'lib/fox/template/*' )

  spec.files                += Dir.glob( 'lib/thrift/**/*' )

  spec.test_files           += Dir.glob( 'test/**/*' )
  spec.test_files           += Dir.glob( 'spec/**/*' )
  spec.test_files           += Dir.glob( 'features/**/*' )

  ## Dependencies

  # Ruby VM
  spec.required_ruby_version  = '~> 2.1'

  # General
  spec.add_runtime_dependency 'thor'

  # Package building
  spec.add_runtime_dependency 'fpm'

  # Shell
  spec.add_runtime_dependency 'ptools'
  spec.add_runtime_dependency 'os'
  spec.add_runtime_dependency 'progressbar'


  # Database ORM (Persistent)
  spec.add_runtime_dependency 'datamapper'
  spec.add_runtime_dependency 'data_mapper'
  spec.add_runtime_dependency 'dm-core'
  spec.add_runtime_dependency 'dm-tags'
  spec.add_runtime_dependency 'dm-migrations'
  spec.add_runtime_dependency 'dm-types'
  spec.add_runtime_dependency 'dm-enum'
  spec.add_runtime_dependency 'dm-validations'
  spec.add_runtime_dependency 'dm-timestamps'
  spec.add_runtime_dependency 'dm-sqlite-adapter'
  spec.add_runtime_dependency 'dm-do-adapter'

  # Data RPCs and Messaging
  spec.add_runtime_dependency 'msgpack'

  spec.add_runtime_dependency 'faraday'
  spec.add_runtime_dependency 'mime-types'

  # Data Exchange Containers/Parsing
  spec.add_runtime_dependency 'oj'

  # Caching
  spec.add_runtime_dependency 'moneta'

  # Mail
  spec.add_runtime_dependency 'pony'

  # l10n
  spec.add_runtime_dependency 'gettext'

  # Rest interface
  spec.add_runtime_dependency 'rack'

  # Monadic/Functional
  spec.add_runtime_dependency 'andand'
  # spec.add_runtime_dependency 'ick'

  # Audio
  spec.add_runtime_dependency 'taglib-ruby'

  # Misc System
  # spec.add_runtime_dependency 'awesome_print'
  # spec.add_runtime_dependency 'uuid'

  ## System libraries needed (info for the user)
  # spec.requirements 'iconv zlib libmagic'

  # spec.requirements 'redis-server'
  # spec.requirements 'sqlite3 libsqlite3-dev'


  ## Post Install
  #
  # Thanks go to Todd Vargo for the Ascii Fox
  # Reference: http://www.retrojunkie.com/asciiart/animals/foxes.htm
  spec.post_install_message = <<-EOS

   /\   /\             ----( Paper )---- 
  //\\_//\\     ____     _____ _____  __ 
  \_     _/    /   /    |  ___/ _ \ \/ / 
   / * * \    /^^^]     | |_ | | | \  /  
   \_\O/_/    [   ]     |  _|| |_| /  \  
    /   \_    [   /     |_|   \___/_/\_\ 
    \     \_  /  /                       
     [ [ /  \/ _/      ----------------- 
    _[ [ \  /_/                          

    (c) #{spec.date.to_s}, All rights reserved
    Bjoern Rennhak

    Don't forget to configure $HOME/.fox/config.
    To generate config file under $HOME/.fox/ directory,
    please run 'fox config:generate' command

    Thanks for installing Fox !
  EOS

end # of Gem::Specification.new do |s|


# vim:ts=2:tw=100:wm=100:syntax=ruby
