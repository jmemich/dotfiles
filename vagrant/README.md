# VM

Download virtual box
    https://www.virtualbox.org/

Download vagrant
    https://www.vagrantup.com/downloads.html

# Vagrant -- getting started

Read the 'Getting Started' docs
    https://www.vagrantup.com/docs/getting-started/

```
vagrant init # initialize a Vagrantfile
vagrant up # built a VM based on a Vagrantfile
vagrant ssh # ssh into VM
```
```
vagrant reload # get changes in Vagrant file
```
```
vagrant provision # re-provision the VM instance (calls provision args -- only -- again)
```
Shutting down options

```
vagrant suspend # quick to reboot
vagrant halt # graceful shutdown
vagrant destroy # nukes everything, reclaims RAM
```

# Pro Tip(s)

Put Vagrant file in `~/` directory so can work with same files from both within VM and on Host.
