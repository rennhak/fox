#!/usr/bin/env ruby

# System
require 'data_mapper'


# @class      class Model
# @brief      mapper for Model table, save information about all created Models
class Model

  include DataMapper::Resource

  property :id,          Serial
  property :name,        String
  property :version,     String
  property :uuid,        String

end # of class Model

