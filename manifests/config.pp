#
# == Class: agilefant::config
#
# Configure agilefant
#
class agilefant::config
(
    $db_user,
    $db_password,
    $database,
    $db_host

) inherits agilefant::params
{

    include tomcat::params
    include os::params

    # Set up the database connection. Although currently on MySQL is supported,
    # in theory the template file could be adapted for other databases and as
    # such is not database server-specific.
    file { 'agilefant-database.properties':
        ensure => present,
        name => "${::tomcat::params::autodeploy_dir}/agilefant/WEB-INF/database.properties",
        content => template('agilefant/database.properties.erb'),
        owner => root,
        group => "${::os::params::admingroup}",
        mode => 644,
        require => Class['agilefant::install'],
    }

    include agilefant::config::apache2

    class { 'agilefant::config::mysql':
        db_user => $db_user,
        db_password => $db_password,
        database => $database,
        db_host => $db_host,
    }
}
