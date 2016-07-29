# This file/Class not used in this project but kept for reference
# of how to manually create a join-table.

require 'data_mapper'
require 'dm-postgres-adapter'

class Tagging
include DataMapper::Resource

belongs_to :link, :key => true
belongs_to :tag, :key => true

end
