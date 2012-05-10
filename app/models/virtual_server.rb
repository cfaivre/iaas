class VirtualServer
  include Mongoid::Document
  field :name, :type => String
  field :ip, :type => String
  field :belongs_to, :type => String
  embedded_in :nodes

  def self.create(options={})
    options.required! :blablabla
    ProxmoxClient.virtual_server_create(options)
  end

  def self.delete(options={})
    options.required! :blablabla
    ProxmoxClient.virtual_server_delete(options)
  end
end
