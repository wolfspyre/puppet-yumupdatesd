# == Class: yumupdatesd::config
#  wrapper class
#Class['yumupdatesd::config']
class yumupdatesd::config {
  #clean up our parameters
  $ensure             = $yumupdatesd::ensure
  case $ensure {
    present, enabled, active, disabled, stopped: {
    }#end configfiles should be present case
    absent: {
      file {'yumupdatesd_conf':
        ensure  => 'absent',
        path    =>  $configfilepath,
      }#end yumupdatesdd.conf file
      file {'/etc/init.d/yumupdatesd':
        ensure => 'absent',
      }#End init file
      file {'yumupdatesd_logfile':
        ensure  => 'absent',
        path    => $logfile,
      }#end yumupdatesd logfile file
    }#end configfiles should be absent case
    default: {
      notice "yumupdatesd::ensure has an unsupported value of ${yumupdatesd::ensure}."
    }#end default ensure case
  }#end ensure case
}#end class
