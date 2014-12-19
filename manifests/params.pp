#
# == Class: agilefant::params
#
# Defines some variables based on the operating system
#
class agilefant::params {

    case $::osfamily {
        'Debian': {
            $basename = 'agilefant'
            $package_name = "agilefant3.war"
            $font_packages = ['ttf-dejavu', 'ttf-mscorefonts-installer']
        }
        default: {
            fail("Unsupported operating system: ${::osfamily}/${::operatingsystem}")
        }
    }
}
