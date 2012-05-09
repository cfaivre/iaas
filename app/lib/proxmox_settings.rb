require 'settingslogic'

class ProxmoxSettings < Settingslogic
  source File.join(Rails.root, "config", "proxmox.yml")
  namespace Rails.env
end