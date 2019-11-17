# nginx_nodejs_autostart_vagrant

                
This guide will allow you to install and autorun nginx and nodejs with Supervisor process monitor and controller on CentOS7 Linux with Vagrant 

Author: Gergely Jasusa
Date: 17.11.2019

Pre-requirement:
                * Installed Vagrant



Script explanation for scripts/install.sh:


installs nginx webserver, starts it and make it autostart on boot.

installs nodeJS and dependencies from custom repository.

installs Supervisor process monitor and controller (It can monitor and contorl the changes on files and processes)

makes a Systemd Unit (/lib/systemd/system/nodejs.service) file with echo for nodeJS to be able to autostart on boot with monitoring changes in (share/index.js).

reloads Systemd daemon for nodeJS with unit file created and make it autostart on boot.

installs git


Explanation for Vagrantfile:

#
config.vm.box = "geerlingguy/centos7"
-->
installs custom basebox created by geerlingguy from CentOS 7
#

#
config.vm.network "forwarded_port", guest: 6111, host: 3222, host_ip: "127.0.0.1" --> Configure port forwarding from your VM's port 6111 to your local OS port 3222
#

#
config.vm.network "private_network", type: "dhcp"
--> 
Configure dhcp setting on your network
#

#
config.vm.synced_folder "./share", "/etc/nginx/" 
--> 
Make a two-way shared folder between your local OS and your Vagrant vm's nginx folder
#

#
config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
   end
-->
Configure your Vagrant VM's memory allocation to 1024MB
#

#
config.vm.provision "shell", path: "scripts/install.sh"
-->
Trigger the install script located in scripts/install.sh what's gonna do the job
#