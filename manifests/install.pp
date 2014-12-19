#
# == Class: agilefant::install
#
# Install agilefant
#
class agilefant::install inherits agilefant::params {

    # Use the Tomcat module to install agilefant.war
    tomcat::war { 'agilefant':
        source => "puppet:///files/${::agilefant::params::package_name}",
    }

    # Install fonts
    package { $::agilefant::params::font_packages:
        ensure => installed,
    }

}
