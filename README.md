# Odlgem

This gem is made as a ruby wrapper for OpenDaylight's FlowProgrammer api

## Installation

Add this line to your application's Gemfile:

    gem 'odlgem', :git => "https://github.com/rickpr/odlgem.git"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install odlgem

## Usage

Configure with an initializer in config/initializers as follows:

    Odlgem.configure do |config|
      config.username = "your_username"
      config.password = "your_password"
      config.url = "http://yourserver.com:port/"
    end

Then make a call to Odlgem's OpenDaylight.makeflow:

For example:
    Odlgem::OpenDaylight.makeflow(id: "00:00:00:00:00:00:00:02", name: "flow1", actions: "DROP")

Here are the possible arguments for makeflow. All the arguments default to nil unless otherwise specified:

    #Server information
    url			#Your controller's web url, usually "http://yourserver.com:8080/" (defaults to config url in initializer)
    username		#OpenDaylight login username (defaults to config username in initializer)
    password		#OpenDaylight login password (defaults to config password in initializer)

    #Flow Parameters
    id			#Node ID (usually MAC address) *REQUIRED*
    name		#Flow Name *REQUIRED*
    actions		#OpenDaylight OpenFlow Action *REQUIRED*
    ingressPort		#Layer 1 (physical) Source Port
    dlSrc		#Layer 2 (MAC address) source
    dlDst		#Layer 2 (MAC address) Destination
    nwSrc		#Layer 3 (IP address) source
    nwDst		#Layer 3 (IP address) destination
    tpSrc		#Layer 4 (Network Socket Port) Source
    tpDst		#Layer 4 (Network Socket Port) destination
    installInHW		#Make the flow installed and active (default "true")
    type		#Node Type (default "OF")
    protocol		#IP Protocol Number (default "6")
    etherType		#Ethertype field (default "0x800")
    vlanId		#Virtual LAN ID
    vlanPriority	#Virtual LAN QoS Priotity
    idleTimeout		#Flow Idle Timeout
    priority		#Flow Priority
    tosBits		#Type of Service Bits
    hardTimeout		#Flow Hard Timeout
    cookie		#Cookie enhancements



## Contributing

1. Fork it ( https://github.com/[my-github-username]/odlgem/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
