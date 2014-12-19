#
# == Class: agilefant::config::mysql
#
# Configure mysql for agilefant
#
class agilefant::config::mysql
(
    $db_user,
    $db_password,
    $database,
    $db_host

) inherits agilefant::params
{
    mysql::grant { 'agilefant-agilefant':
        user => 'agilefant',
        password => 'x4zadBJKN',
        database => 'agilefant3',
        host => $db_host,
        privileges => 'ALL',
    }
}
