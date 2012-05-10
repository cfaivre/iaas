require 'spec_helper'

describe Node do
  context "index" do
    it "should make a call to get the node status" do
#     response = mock('HTTParty::Response', :code => 200)
#     HTTParty.should_receive(:get).and_return(response)
     ProxmoxClient.should_receive(:node_status).and_return() 
 
    end
  end
  
end
