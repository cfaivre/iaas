class Node
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  field :name, :type => String
  field :ip, :type => String
  field :storage_available, :type => Integer
  field :memory_available, :type => Integer
  validates :ip, :ip => true
  validates_uniqueness_of :ip, :message => "IP address is not unique"
  embeds_many :virtual_servers
  accepts_nested_attributes_for :virtual_servers, :reject_if => lambda{|a| a[:name].blank? && a[:ip].blank? && a[:belongs_to].blank? }, :allow_destroy => true

  def self.statistics

  end

  def self.update_statistics!
    self.storage_available = self.actual_storage_usage["avail"]
    self.memory_available = self.actual_memory_usage["free"]
    self.save!
  end

  def self.provision_virtual_server(options={})
    options.required! :storage_size, :memory_size
    node_name = JSON.parse(Nodes.where(:memory_available.gt => options[:memory_size], :storage_available.gt => options[:storage_size]).without(:_id, :_type).first).to_json["name"]
    VirtualServer.create(options.merge!(:node_name => node_name))
    self.update_staistics!
  end

  private

  def self.actual_storage_usage
    ProxmoxClient.node_storage.find { |node_storage| node_storage["storage"] == "VM_Storage" }
  end

  def self.actual_memory_usage
     ProxmoxClient.node_status["data"]["memory"]
  end

end
