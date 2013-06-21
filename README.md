#myumupdatesd

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with yumupdatesd](#setup)
    * [What yumupdatesd affects](#what-yumupdatesd-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with yumupdatesd](#beginning-with-yumupdatesd)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

##Overview

This module manages the installation and configuration of yumupdatesd on rhel variant OSes.

##Module Description

yum-updatesd makes it a little easier to manage a herd of rhel/centos boxes by emailing you, or automatically notifying you when packages are updated.

##Setup

###What yumupdatesd affects

* Files
    * /etc/yum/yum-updatesd.conf
* Package
    * yum-updatesd
* Service
    * yum-updatesd
* Miscellaneous:
    * an RHEL/CentOS 6 RPM is contained in the files section of this module

###Setup Requirements **OPTIONAL**

If your module requires anything before setting up (pluginsync enabled, etc.) this is where you mention it.

###Beginning with yumupdatesd

* Configure an smtp server that your systems can send mail to.
* Configure the following parameters:
    * emit_via
    * email_from
    * email_to
    * smtp_server

##Usage

####Invocation methods:
* Update the parameters either via puppet3 data bindings
* Use a profile module like the one included in the example directory.
* Declare the class directly and provide custom values at that time.
* Alter the module's default values.

##Reference

##Limitations

yum-updatesd is not natively supported on rhel/cent6 hosts. There is a repackaged RPM from fc15 in the files of this module. The package was built from this source:
http://kojipkgs.fedoraproject.org/packages/yum-updatesd/0.9/4.fc15/src/

##Development



##Release Notes/Contributors/Etc **Optional**

added rebuilt yum-updatesd module
