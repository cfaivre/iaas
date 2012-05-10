class Node
  include Mongoid::Document
  field :name, :type => String
  field :ip, :type => String
  field :storage_avilable, :type => Double
  field :memory_available, :type > Double
  embeds_many :virtual_servers
  accepts_nested_attributes_for :virtual_servers, :reject_if => lambda{|a| a[:name].blank? && a[:ip].blank? && a[:belongs_to].blank? }, :allow_destroy => true

  def self.update_storage_available
    self.storage_avilable = self.actual_storage_usage["avail"]
  end

  def self.update_memory_available
    self.memory_available = self.actual_memory_usage["free"]
  end

  def provision_virtual_server(options={})
    options.required! :storage_size, :memory_size
    if options[:storage_size] < self.storage_available && options[:memory_size] < self.memory_available
      ProxmoxClient.virtual_server_create(options)
    end
  end

  private

  def self.actual_storage_usage
    ProxmoxClient.node_storage.find { |node_storage| node_storage["storage"] == "VM_Storage" }
  end

  def self.actual_memory_usage
     ProxmoxClient.node_status["data"]["memory"]
  end

end
