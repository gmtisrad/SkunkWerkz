# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  ## Define our server
  config.vm.define "webserver" do |webserver|

    # Use the bento Ubuntu off the Vagrant machine inventory
    webserver.vm.box = "bento/ubuntu-16.04"

    # Use the private network 192.168.111.222 to try to avoid conflicts
    webserver.vm.network "private_network", ip: "192.168.111.222"

    # Create a SymLink for when we have assets later on.
    webserver.vm.synced_folder ".", "/var/www/skunkwerkz"
  end

  ## Provision with Ansible
  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"

    # Vagrant environment variables
    ansible.groups = {
      "webservers" => ["webserver"],
      "fresh" => ["webserver"],
      "webservers:vars" => {
        "app_environment" => "staging",
        "repo" => "git@github.com:gmtisrad/SkunkWerkz.git",
        "version" => "enhancement/add-user-vatin"
      }
    }

    ansible.extra_vars = {
      # Variable to check if we're in a vagrant environment (for Ansible)
      is_vagrant: true,
    }

    ansible.playbook = "ansible/initial_provision.yml"
  end

end
