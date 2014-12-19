# == Class: php::fpm::package
#
# Configure fpm package
#
# === Parameters
#
# [*package_name*]
#   The name of the php-fpm package
#
# [*package_ensure*]
#   Status of the package
#
# === Authors
#
# Christian "Jippi" Winther <jippignu@gmail.com>
# Robin Gloster <robin.gloster@mayflower.de>
#
# === Copyright
#
# See LICENSE file
#
class php::fpm::package(
  $ensure  = $php::ensure,
  $package = $php::params::fpm_package,
) inherits php::params {

  if $caller_module_name != $module_name {
    warning('php::fpm::package is private')
  }

  package { $package:
    ensure  => $ensure,
    require => [Class['php::packages'], Class['php::cli']],
  }
}
