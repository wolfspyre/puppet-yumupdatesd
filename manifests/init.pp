# == Class: yumupdatesd
#
# This class manages the needs of yumupdatesd.
#
# === Parameters
#
# [*comments*]         - Boolean option to decide whether or not to
#   display comments in config files
#
# [*config_file*]      - the configfile. Default: /etc/yum/yum-updatesd.conf
#
# [*dbus_listener*]    - Should we listen via dbus to give out update
#   information/check for new updates
# [*do_download*]      - Boolean option to decide whether or not updates should
#   be automatically downloaded.  Defaults to False.
#
# [*do_download_deps*] -  Boolean  option  to automatically download
#   dependencies of packages which need updating as well.  Defaults to False.
#
# [*do_update*]        - Boolean  option to decide whether or not updates
#   should be automatically applied.  Defaults to False.
#
# [*email_from*]       - Email  address for update notifications to be from.
#   Defaults to ‘yum-updatesd@localhost’.
#
# [*email_to*]         - List of email addresses to send update notification to.
#   Defaults to ‘root@localhost’.
#
# [*emit_via*]         - List of ways to emit update notification. Valid values:
#   ‘email’, ‘dbus’ and ‘syslog’.
#
# [*ensure*]           - supported values:
#   present, enabled, active, disabled, stopped, and absent
#
# [*package_name*]     - The name of the package to install
#
# [*run_interval*]     - Number of seconds to wait between checks for available
#   updates.
#
# [*service_name*]     - The name of the service to manage
#
# [*smtp_server*]      - SMTP server to use when sending mail, host or a
#   host:port string. Defaults to ‘localhost:25’.
#
# [*syslog_facility*]  - What syslog facility should be used.
#   Defaults to ‘DAEMON’.
#
# [*syslog_level*]     - Level of syslog messages. Defaults to ‘WARN’.
#
# [*update_refresh*]   - Minimum  number  of seconds between update information
#   refreshes to avoid hitting the server too often.
#
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
class yumupdatesd(
$ensure           = 'enabled',
$comments         = true,
$config_file      = $yumupdatesd::params::config_file,
$dbus_listener    = true,
$do_download      = false,
$do_download_deps = false,
$do_update        = false,
$email_from       = 'yum-updatesd@localhost',
$email_to         = 'root@localhost',
$emit_via         = 'email',
$package_name     = $yumupdatesd::params::package_name,
$run_interval     = '3600',
$service_name     = $yumupdatesd::params::service_name,
$smtp_server      = 'localhost:25',
$syslog_facility  = 'DAEMON',
$syslog_level     = 'WARN',
$update_refresh   = '600'
)inherits yumupdatesd::params{
#  validate_re($ensure,   ['present', 'enabled', 'active', 'disabled', 'stopped', 'absent'], "The ensure parameter has an unsupported value of ${ensure}")
#  validate_re($emit_via, ['email', 'dbus', 'syslog'], "The emit_via parameter has an unsupported value of ${emit_via}")
  case $::osfamily {
    RedHat: {
      case $::operatingsystemrelease {
        /^5./: {
          include yumupdatesd::package
          include yumupdatesd::config
          include yumupdatesd::service
          Class['yumupdatesd::package'] -> Class['yumupdatesd::config'] -> Class['yumupdatesd::service']
        }
        /^6./: {
          notice "Sorry. $::{operatingsystem} ${::operatingsystemrelease} doesn't support yum-updatesd.Looking at PackageKit"
        }
      }
    }
    default: {}
  }
}