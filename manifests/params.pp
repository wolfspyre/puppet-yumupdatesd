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
  # In case these ever change between major osversion, and we need to adjust
  # defaults I'll leave these here. but they're not currently in use.
  #$do_download      = false
  #$do_download_deps = false
  #$do_update        = false
  #$email_from       = 'yum-updatesd@localhost'
  #$email_to         = 'root@localhost'
  #$emit_via         = 'email'
  #$run_interval     = '3600'
  #$smtp_server      = 'localhost:25'
  #$syslog_facility  = 'DAEMON'
  #$syslog_level     = 'WARN'
  #$update_refresh   = '600'
  case $::osfamily {
    RedHat: {
      $config_file  = '/etc/yum/yum-updatesd.conf'
      $package_name = 'yum-updatesd'
      $service_name = 'yum-updatesd'
    }
    default: {}
  }
}
