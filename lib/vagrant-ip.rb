module Vagrant
  module Driver
    # Driver for VirtualBox 4.2.x
    class VirtualBox_4_2
      def read_guest_bridged_ip
        output = execute("guestproperty", "get", @uuid, "/VirtualBox/GuestInfo/Net/0/V4/IP", :retryable => true)
        output[/^Value: (.+?)$/, 1]
      end
    end

    class VirtualBox
      def_delegators :@driver, :read_guest_bridged_ip
    end
  end
end

class VagrantIp < Vagrant::Command::Base
  def execute
    with_target_vms(nil, :single_target => true) do |vm|
      raise Vagrant::Errors::VMNotCreatedError if !vm.created?
      raise Vagrant::Errors::VMInaccessible if !vm.state == :inaccessible
      if ip = vm.driver.read_guest_bridged_ip
        puts ip
      end
    end
  end

end
Vagrant.commands.register(:ip) { VagrantIp }
