require 'spec_helper'

describe VirtualServer do

  nodes = Node.all
  virtual_servers = nodes.collect{|node| node.virtual_servers}
  p JSON.parse(virtual_servers.flatten.to_json)

  p JSON.parse(VirtualServer.where(:name => "vm1").to_json)
  pending "add some examples to (or delete) #{__FILE__}"
end
