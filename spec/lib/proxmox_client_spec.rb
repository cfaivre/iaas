 class ProxmoxClient

  def self.node_status(options={})
    @auth = {:username => ProxmoxSettings.username, :password => ProxmoxSettings.password}
    response = HTTParty.get(ProxmoxSettings.auth_url_template, :basic_auth => @auth, :query => options)
    return true if response.code == 200
    return false
  end

 end



require 'spec_helper'

describe ProxmoxClient do

  before(:each) do
    @username = "test"
    @password = "example"
    @auth = {:username => @username, :password => @password}
  end

  context "successful node status" do
    it "returns true" do
      response = mock('HTTParty::Response', :code => 200)
      HTTParty.stub(:get).and_return(response)

      ProxmoxClient.node_status.should be_true
    end
  end

  context "unsuccessful node status" do
    it "returns false" do
      response = mock('HTTParty::Response', :code => 404)
      HTTParty.stub(:get).and_return(response)
      ProxmoxClient.node_status.should be_false
    end
  end

  it "makes a request to Proxmox for the node status" do
    response = mock('HTTParty::Response', :code => 200)
    HTTParty.should_receive(:get).and_return(response)
    ProxmoxClient.node_status
  end

end