Vagrant.configure("2") do |config|
    # Plugins
    config.omnibus.chef_version = :latest
    config.berkshelf.enabled = true

    # Network
    config.vm.network :forwarded_port, guest: 80, host: 8080

    config.vm.define "nginx" do |nginx_server|
      nginx_server.vm.box = "hashicorp/bionic64"
      nginx_server.vm.hostname = "chef-server"
      nginx_server.vm.network "private_network", ip: "10.0.0.10"

      nginx_server.vm.provision "chef_solo" do |chef|
        chef.add_recipe "web"
        chef.arguments = '--chef-license accept'
        chef.install = false

      end

    end
  end
