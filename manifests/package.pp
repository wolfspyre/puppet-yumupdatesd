# == Class: yumupdatesd::package
#  wrapper class
#
class yumupdatesd::package {
  $packagename        = $yumupdatesd::package_name
  # end of variables
  case $yumupdatesd::ensure {
    present, enabled, active, disabled, stopped: {
      #everything should be installed
      package { $packagename:
        ensure => 'present',
      }
    }#end present case
    absent: {
      #everything should be removed
      package { $packagename:
        ensure => 'absent',
      }
    }#end absent case
    default: {
      notice "yumupdatesd::ensure has an unsupported value of ${yumupdatesd::ensure}."
    }#end default ensure case
  }#end ensure case
}#end class
