class VirtualServer
  include Mongoid::Document
  field :name, :type => String
  field :ip, :type => String
  field :belongs_to, :type => String
  validates :ip, :ip => true
  validates_uniqueness_of :ip, :message => "IP address is not unique"
  belongs_to :nodes

  def self.create(options={})
    options.required! :blablabla
    ProxmoxClient.virtual_server_create(options)
  end

  def self.delete(options={})
    options.required! :blablabla
    ProxmoxClient.virtual_server_delete(options)
  end
end
