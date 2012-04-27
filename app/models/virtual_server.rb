class VirtualServer
  include Mongoid::Document
  field :name, :type => String
  field :ip, :type => String
  embedded_in :nodes
end
