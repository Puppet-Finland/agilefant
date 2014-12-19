#
# == Class: agilefant::config::apache2
#
# Configure Apache2 to reverse proxy Agilefant.
#
# NOTE: this class currently on takes care of ensuring that the proxy and 
# proxy_http modules are loaded. Something like this has to be added manually to 
# the appropriate VirtualHost definition:
#
#   ProxyPass /agilefant http://localhost:8080/agilefant
#   ProxyPassReverse /agilefant http://localhost:8080/agilefant
#
class agilefant::config::apache2 inherits agilefant::params {

    include apache2::config::proxy
    include apache2::config::proxy_http
}
