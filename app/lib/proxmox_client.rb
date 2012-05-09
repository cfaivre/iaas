 class ProxmoxClient

  def self.node_status(options={})
    @auth = {:username => ProxmoxSettings.username, :password => ProxmoxSettings.password}
    response = HTTParty.get(ProxmoxSettings.auth_url_template, :basic_auth => @auth, :query => options)
    return true if response.code == 200
    return false
  end

end