# == Class: yumupdatesd::config
#  wrapper class
#Class['yumupdatesd::config']
class yumupdatesd::config {
  include yumupdatesd
  #clean up our parameters
  $config_file        = $yumupdatesd::config_file
  $ensure             = $yumupdatesd::ensure
  case $ensure {
    present, enabled, active, disabled, stopped: {
      file {$config_file:
        ensure  => file,
        content => template('yumupdatesd/etc/yum-updatesd.conf.erb'),
        group   => 'root',
        mode    => '0644',
        owner   => 'root',
      }
    }#end configfiles should be present case
    absent: {
      file {$config_file:
        ensure  => 'absent',
      }#end yumupdatesd.conf file
    }#end configfiles should be absent case
    default: {
      notice "yumupdatesd::ensure has an unsupported value of ${yumupdatesd::ensure}."
    }#end default ensure case
  }#end ensure case
}#end class
