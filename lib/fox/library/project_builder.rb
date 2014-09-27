#! /usr/bin/env ruby


# System
require 'thor'
require 'andand'
require 'fileutils'


# @fn       class ProjectBuilder
# @brief    Handles project bootstrapping via convenient Fox DSL
class ProjectBuilder

  def initialize name
    @name           = name
    @top_level_dir  = Dir.pwd
    @project_dir    = File.join(@top_level_dir, @name)

    FileUtils.mkdir_p( @project_dir )

    @cwd            = @project_dir
  end

  def self.load project_name, dsl
    proj = new( project_name )
    proj = proj.instance_eval( File.read(dsl), dsl )
    proj
  end # of def self.load }}}


  def create_project
    yield
  end # of def create_project }}}

  def dir dir_name
    old_cwd = @cwd
    @cwd    = File.join(@cwd, dir_name)
    FileUtils.mkdir_p(@cwd)
    yield self if block_given?
  ensure
    @cwd = old_cwd
  end # of def dir }}}

  def touch *file_names
    file_names.flatten.each do |file|
      FileUtils.touch( File.join(@cwd, "#{file}") )
    end
  end # of def touch }}}

  # def create_rb_file(file_names)
  #   file_names.each { |file| touch(file + ".rb") }
  # end

  # def create_from_template(template_id, filename)
  #   File.open(File.join(@cwd, filename), "w+") { |f|
  #     str = TEMPLATES[template_id]
  #     str.gsub!(/%[^%]+%/) { |m| instance_eval m[1..-2] }
  #     f.puts str
  #   }
  # end

end # of class ProjectBuilder

# vim:ts=2:tw=100:wm=100:syntax=ruby
