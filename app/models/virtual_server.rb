class VirtualServer
  include Mongoid::Document
  field :name, :type => String
  field :ip, :type => String
  field :belongs_to, :type => String
  embedded_in :nodes
end
