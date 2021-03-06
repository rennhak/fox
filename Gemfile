# File: Gemfile

# Sources to draw gems from
source "https://rubygems.org"
# source 'http://gems.rubyforge.org'
# source 'http://gemcutter.org'


# Depend on a certain ruby version
ruby '2.1.3'


group :default do # {{{

  # System
  gem 'bundler'
  gem 'rake'

end # }}}

group :development do # {{{

  # Generate manuals
  gem 'ronn', '<= 0.7.2'
  gem 'rdiscount'

  # REPL
  gem 'racksh'
  gem 'pry'

  platforms :ruby_19, :ruby_20 do
    gem 'pry-debugger'
    gem 'pry-stack_explorer'
  end

  gem 'guard'
  gem 'guard-rake'
  gem 'guard-shell'

end # }}}

group :test do # {{{

  # Unit-tests
  gem 'rspec', '~> 3.0.0'
  gem 'rspec-its'
  gem 'rspec-mocks'
  gem 'guard-rspec', require: false

  # Integration tests
  gem 'aruba'
  gem 'cucumber'

  # Metrics
  gem 'simplecov', '~> 0.9.0'
  gem 'simplecov-rcov'
  gem 'simplecov-rcov-text'
  gem 'metric_fu', '>= 4.5.x'

  # Fixture helper
  gem 'randexp'

  # Spice up testing
  gem 'nyan-cat-formatter'

end # }}}

group :security do # {{{

  # 0-days?
  gem 'bundler-audit'

  # Secure credentials
  gem 'secure_yaml'

end # }}}

group :profiling do # {{{

  gem 'stackprof'

end # }}}

group :docs do # {{{

  gem 'yumlcmd'
  gem 'coderay'
  gem 'redcarpet'
  gem 'github-markup'
  gem 'htmlentities'

  # Documentation
  gem 'yard'
  gem 'wicked_pdf'
  gem 'wkhtmltopdf'

end # }}}


# Declare fox.gemspec
gemspec



# vim:ts=2:tw=100:wm=100
