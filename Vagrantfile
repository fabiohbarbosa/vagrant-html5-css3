Vagrant.configure("2") do |config|
    config.vm.define "html5_css3" do |html5_css3|
    end

    config.vm.box     = "html5_css3"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    config.vm.hostname = "html5css3"

    config.vm.network :private_network, ip: "10.0.0.2"
    config.vm.network "forwarded_port", guest: 35729, host: 35729
    config.vm.network "forwarded_port", guest: 3000, host: 3000
    config.vm.synced_folder "./", "/vagrant", id: "vagrant-root"

    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id,
                    "--name", "html5_css3",
                    "--memory", "512",
                    "--natdnshostresolver1", "on"]
    end

    config.vbguest.auto_update = false

    config.vm.provision :shell, :path => "scripts/welcome.sh"
    config.vm.provision :shell, :inline => "echo \"America/Sao_Paulo\" | sudo ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime"

    config.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path    = "puppet/modules"
      puppet.options        = ['--verbose']
    end
end
