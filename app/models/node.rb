class Node
  include Mongoid::Document
  field :name, :type => String
  field :ip, :type => String
  embeds_many :virtual_servers
  accepts_nested_attributes_for :virtual_servers, :reject_if => lambda{|a| a[:name].blank? && a[:ip].blank? && a[:belongs_to].blank? }, :allow_destroy => true

  def self.available_storage
    self.storage_usage[]
  end

  def self.available_memory
  end

  private

  def self.storage_usage
  end

  def self.memory_usage
    
  end

end
