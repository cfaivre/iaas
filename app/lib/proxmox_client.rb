 class ProxmoxClient

  def self.node_status(options={})
    options.required! :node
    @auth = {:username => ProxmoxSettings.username, :password => ProxmoxSettings.password}
    response = HTTParty.get(ProxmoxSettings.node_status_template, :basic_auth => @auth, :query => options)
    return response.body if response.code == 200
    return false
  end

  def self.node_storage(options={})
    options.required! :node
    @auth = {:username => ProxmoxSettings.username, :password => ProxmoxSettings.password}
    response = HTTParty.get(ProxmoxSettings.node_storage_template, :basic_auth => @auth, :query => options)
    return response.body if response.code == 200
    return false
  end

  def self.virtual_server_create(options={})
    options.required! :node, :vmid
    @auth = {:username => ProxmoxSettings.username, :password => ProxmoxSettings.password}
    response = HTTParty.get(ProxmoxSettings.virtual_server_create_template, :basic_auth => @auth, :query => options)
    return response.body if response.code == 200
    return false
  end

end
