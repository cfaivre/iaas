class Node
  include Mongoid::Document
  field :name, :type => String
  field :ip, :type => String
  embeds_many :virtual_servers
  accepts_nested_attributes_for :virtual_servers, :reject_if => lambda{|a| a[:name].blank? }, :allow_destroy => true
end
