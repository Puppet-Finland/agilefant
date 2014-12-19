#
# == Class: agilefant
#
# A Puppet module for managing agilefant:
#
# <http://agilefant.com>
#
# Note that the module expects to find agilefant3.war at the root of the Puppet
# fileserver. This could be avoided if agilefant was packaged for Debian.
#
# Also note that Apache2 reverse proxy is currently partial: see
# agilefant::config::apache2 details. The module also currently assumes that
# MySQL is being used.
#
# == Parameters
#
# [*db_user*]
#   MySQL database user. Defaults to 'agilefant'.
# [*db_password*]
#   MySQL database password.
# [*database*]
#   Name of the Agilefant database. Defaults to 'agilefant'.
# [*db_host*]
#   Database server's hostname. Defaults to 'localhost'.
#
# == Authors
#
# Samuli Seppänen <samuli@openvpn.net>
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
# == License
#
# BSD-license. See file LICENSE for details.
#
class agilefant
(
    $db_user = 'agilefant',
    $db_password,
    $database = 'agilefant',
    $db_host = 'localhost'

) inherits agilefant::params
{

# Rationale for this is explained in init.pp of the sshd module
if hiera('manage_agilefant', 'true') != 'false' {

    include agilefant::install

    class { 'agilefant::config':
        db_user => $db_user,
        db_password => $db_password,
        database => $database,
        db_host => $db_host,
    }
}
}
