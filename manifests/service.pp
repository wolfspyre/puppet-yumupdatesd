# == Class: yumupdatesd::service
#  wrapper class
#
class yumupdatesd::service {
  $packagename        = $yumupdatesd::package_name
  $servicename        = $yumupdatesd::service_name
  # end of variables
  case $yumupdatesd::ensure {
    present, enabled, active:  {
      #everything should be installed, but puppet is not managing the state of the service
      service {$servicename:
        ensure    => running,
        enable    => true,
        subscribe => File['yumupdatesd_conf'],
        require   => Package[$packagename],
        hasstatus => true,
      }#end service definition
    }#end enabled class
    disabled, stopped: {
      service {$servicename:
        ensure    => stopped,
        enable    => false,
        subscribe => File['yumupdatesd_conf'],
        hasstatus => true,
      }#end service definition
    }#end disabled
    default: {
      #nothing to do, puppet shouldn't care about the service
    }#end default ensure case
  }#end ensure case
}#end class