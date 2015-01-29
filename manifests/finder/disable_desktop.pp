# Public: Disable desktop
class osx::finder::disable_desktop {
  include osx::finder

  boxen::osx_defaults { 'Disable desktop':
    user   => $::boxen_user,
    domain => 'com.apple.finder',
    key    => 'CreateDesktop',
    value  => false,
    notify => Exec['killall Finder'];
  }
}
