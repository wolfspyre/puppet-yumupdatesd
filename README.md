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

* A list of files, packages, services, or operations that the module will alter, impact, or execute on the system it's installed on.
* This is a great place to stick any Warnings.
* Can be in list or paragraph form.

###Setup Requirements **OPTIONAL**

If your module requires anything before setting up (pluginsync enabled, etc.) this is where you mention it.

###Beginning with yumupdatesd

The very basic steps needed for a user to get the module up and running.

If your most recent release breaks compatibility or requires particular steps for upgrading, you may wish to include an additional section here: Upgrading (For an example, see http://forge.puppetlabs.com/puppetlabs/firewall).

##Usage

Classes, types, and resources for customizing, configuring, and doing the fancy stuff with your module.

##Reference

A list of classes, types, providers, facts, etc. All under-the-hood workings of your module so people know what the module is touching on their system but don't need to mess with things.

##Limitations

yum-updatesd is not natively supported on rhel/cent6 hosts. There is a repackaged RPM from fc15 in the files of this module. The package was built from this source:
http://kojipkgs.fedoraproject.org/packages/yum-updatesd/0.9/4.fc15/src/

##Development

Guidelines and instructions for contributing to your module.

##Release Notes/Contributors/Etc **Optional**

added rebuilt yum-updatesd module
