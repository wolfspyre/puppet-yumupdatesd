# == Class: yumupdatesd
#
# This class manages the needs of yumupdatesd.
#
# === Parameters
#
# Document parameters here.
#
# [*ensure*] - supported values are present, enabled, active, disabled, stopped, and absent
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { yumupdatesd:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Wolf Noble <wolf@wolfspyre.com>
#
# === Copyright
#
# Copyright 2013 Wolf Noble, unless otherwise noted.
#
class yumupdatesd::params{
    case $::osfamily {
      RedHat: {
        $package_name = 'yum-updatesd'
        $service_name = 'yum-updatesd'
      }
    default: {}
  }
}
