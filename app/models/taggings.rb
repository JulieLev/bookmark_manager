require 'data_mapper'
require 'dm-postgres-adapter'

class Tagging
include DataMapper::Resource

belongs_to :link, :key => true
belongs_to :tag, :key => true

end
