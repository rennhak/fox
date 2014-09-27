require 'data_mapper' 

# @class      class History
# @brief      mapper for History table, save information about commands
class History
  include DataMapper::Resource

  property :id,          Serial
  property :command,     String
  property :arguments,   String      
end # of class History

