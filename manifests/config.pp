# == Class: rcs::config
#    See README for documentation.
class rcs::config inherits rcs {

  file { '/etc/default/rcS':
    ensure  => file,
    content => template('rcs/etc/default/rcS.erb'),
  }

}
