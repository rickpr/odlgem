require "odlgem/version"

module Odlgem
  class Configuration
    attr_accessor :username, :password, :url
    def initialize
      username = nil
      password = nil
      url = nil
    end
  end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration) if block_given?
  end

  class OpenDaylight
    def self.makeflow(tpSrc: nil, protocol: "6", vlanId: nil, id: nil, type: "OF", vlanPriority: nil, idleTimeout: nil, priority: nil, ingressPort: nil, tosBits: nil, name: nil, hardTimeout: nil, dlDst: nil, installInHW: "true", etherType: "0x800", actions: nil, cookie: nil, dlSrc: nil, nwSrc: nil, nwDst: nil, tpDst: nil, username: Odlgem.configuration.username, password: Odlgem.configuration.password, url: Odlgem.configuration.url, containerName: "default")
      auth = {username: username, password: password}
      options = {
        headers: {"Content-Type" => "application/json"},
        body: {
          "tpSrc" => tpSrc,
          "protocol" => protocol,
          "vlanId" => vlanId,
          "node" => {
            "id" => id,
            "type" => type
          },
          "vlanPriority" => vlanPriority,
          "idleTimeout" => idleTimeout,
          "priority" => priority,
          "ingressPort" => ingressPort,
          "tosBits" => tosBits,
          "name" => name,
          "hardTimeout" => hardTimeout,
          "dlDst" => dlDst,
          "installInHW" => installInHW,
          "etherType" => etherType,
          "actions" => [actions],
          "cookie" => cookie,
          "dlSrc" => dlSrc,
          "nwSrc" => nwSrc,
          "nwDst" => nwDst,
          "tpDst" => tpDst
          }.to_json,
        basic_auth: auth
      }
      HTTParty.put("#{url}controller/nb/v2/flowprogrammer/#{containerName}/node/#{type}/#{id}/staticFlow/#{name}",options)
    end

    def username
      Odlgem.configuration.username
    end

    def password
      Odlgem.configuration.password
    end

    def url
      Odlgem.configuration.url
    end
  end
  Odlgem.configure
end
