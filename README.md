
# Automatically create nginx server using vagrant , virtualbox , chef-solo

# Development Environment
- Windows 10

# Installation

Download & Install:
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads) (latest version, tested with 6.1.26)
- [Vagrant](https://www.vagrantup.com/downloads.html) (latest version, tested with 2.2.18)
- [Chefdk](https://downloads.chef.io/tools/chefdk) (latest version, tested with 4.13.3)

```shell
vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-berkshelf
```

## Usage

Create VMs from vagrant file

```shell
vagrant up
```

Error message will occur as described in this https://github.com/hashicorp/vagrant/issues/12337 <br >
Edit vagrant file to include the following

```shell
chef.install = false
```
Save the updated vagrant file and update VMs.
```shell
vagrant provision
```

Check nginx is running by entering 10.0.0.10 into your browser

Destroy VMs

```shell
vagrant destroy
```
# Learning objective
* How to write berksfile to automatically download cookbooks by using berksfile
* Use of cookbook_file resource to add files into chef provisioned machine from host

# Learning Points
* Chefdk vs chef-workstaion
* Open issue - https://github.com/hashicorp/vagrant/issues/12337

# References
* https://docs.chef.io/windows/
* https://stackoverflow.com/questions/19125374/how-do-i-configure-chef-solo-to-install-nginx-on-a-new-vagrant-box
