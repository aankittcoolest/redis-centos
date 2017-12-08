# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
	# config.vm.define "alpha" do |subconfig|
	# 	subconfig.vm.box = "centos/7"
	# 	subconfig.vm.network :private_network, ip: "10.0.0.10"
	# 	subconfig.vm.hostname = "alpha"
	# 	subconfig.vm.provision "shell" ,
	# 	path: "./test2.sh"
	# end

	config.vm.define "beta" do |subconfig|
		subconfig.vm.box = "centos/7"
		subconfig.vm.network :private_network, ip: "10.0.0.11"
		subconfig.vm.hostname = "beta"
		subconfig.vm.provision "shell" ,
		path: "./config.sh"
	end

	  # Install avahi on all machines  
	# config.vm.provision "shell", 
	# 	path: "./test.sh"
end

