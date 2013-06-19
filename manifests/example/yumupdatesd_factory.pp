# == Class: yumupdatesd::example::yumupdatesd_factory
#  profile class
#
#
#yumupdatesd::ensure:           'enabled'
#yumupdatesd::enable_6:         true
#yumupdatesd::comments:         true
#yumupdatesd::config_dir:       '/etc/yum/yum-updatesd.conf'
#yumupdatesd::dbus_listener:    true
#yumupdatesd::do_download:      false
#yumupdatesd::do_download_deps: false
#yumupdatesd::do_update:        false
#yumupdatesd::email_from:       'yum-updatesd@localhost'
#yumupdatesd::email_to:         'root@localhost'
#yumupdatesd::emit_via:         'email'
#yumupdatesd::package_name:     'yum-updatesd'
#yumupdatesd::run_interval:     '3600'
#yumupdatesd::service_name:     'yum-updatesd'
#yumupdatesd::smtp_server:      'localhost:25'
#yumupdatesd::syslog_facility:  'DAEMON'
#yumupdatesd::syslog_level:     'WARN'
class yumupdatesd::example::yumupdatesd_factory {
  case $::osfamily {
    RedHat: {
      $ensure           = hiera('yumupdatesd::ensure',           'enabled')
      $enable_6         = hiera('yumupdatesd::enable_6',         true)
      $comments         = hiera('yumupdatesd::comments',         true)
      $config_file      = hiera('yumupdatesd::config_dir',       '/etc/yum/yum-updatesd.conf')
      $dbus_listener    = hiera('yumupdatesd::dbus_listener',    true)
      $do_download      = hiera('yumupdatesd::do_download',      false)
      $do_download_deps = hiera('yumupdatesd::do_download_deps', false)
      $do_update        = hiera('yumupdatesd::do_update',        false)
      $email_from       = hiera('yumupdatesd::email_from',       'yum-updatesd@localhost')
      $email_to         = hiera('yumupdatesd::email_to',         'root@localhost')
      $emit_via         = hiera('yumupdatesd::emit_via',         'email')
      $package_name     = hiera('yumupdatesd::package_name',     'yum-updatesd')
      $run_interval     = hiera('yumupdatesd::run_interval',     '3600')
      $service_name     = hiera('yumupdatesd::service_name',     'yum-updatesd')
      $smtp_server      = hiera('yumupdatesd::smtp_server',      'localhost:25')
      $syslog_facility  = hiera('yumupdatesd::syslog_facility',  'DAEMON')
      $syslog_level     = hiera('yumupdatesd::syslog_level',     'WARN')
      $update_refresh   = hiera('yumupdatesd::update_refresh',   '600')
      $params = {
        ensure           => $ensure,
        enable_6         => $enable_6,
        comments         => $comments,
        config_file      => $config_dir,
        dbus_listener    => $dbus_listener,
        do_download      => $do_download,
        do_download_deps => $do_download_deps,
        do_update        => $do_update,
        email_from       => $email_from,
        email_to         => $email_to,
        emit_via         => $emit_via,
        package_name     => $package_name,
        run_interval     => $run_interval,
        service_name     => $service_name,
        smtp_server      => $smtp_server,
        syslog_facility  => $syslog_facility,
        syslog_level     => $syslog_level,
        update_refresh   => $update_refresh,
      }
      create_resources('class', {'yumupdatesd'         => $params  })
    }
    default: {}
  }#end OS

}#end class
